Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsiOn-0006Lj-VE
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 11:45:34 -0400
Message-ID: <449819F1.2010104@epico.si>
Date: Tue, 20 Jun 2006 17:53:21 +0200
From: Savin Zlobec <savin@epico.si>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATCH] AT91RM9200 NAND support
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>	
	<1150787336.6780.102.camel@localhost.localdomain>	
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>	
	<4497A723.2070006@epico.si>	
	<1150790417.6780.107.camel@localhost.localdomain>	
	<4497BAE2.3010602@epico.si>	
	<1150795093.6780.117.camel@localhost.localdomain>	
	<4497D2CE.7070000@epico.si>	
	<1150801960.6780.132.camel@localhost.localdomain>
	<4497DF09.70404@epico.si>	
	<1150804501.6780.141.camel@localhost.localdomain>	
	<4497E9D4.9040307@epico.si>	
	<1150807480.6780.157.camel@localhost.localdomain>	
	<4497F1B4.8030702@epico.si>	
	<1150809682.6780.172.camel@localhost.localdomain>	
	<4497FCA4.1060601@epico.si>	
	<1150811833.6780.195.camel@localhost.localdomain>	
	<44980505.2000003@epico.si>
	<1150813786.6780.213.camel@localhost.localdomain>
In-Reply-To: <1150813786.6780.213.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Tue, 2006-06-20 at 16:24 +0200, Savin Zlobec wrote:
>  
>
>>Indeed it is the STATUS command. If I don't wait after it I can't copy
>>a single file on the jffs2 partition, inserting a wait there seems to solve
>>the problem.
>>    
>>
>
>Well, we also delay the codepath in nand_wait() with this. It feels
>terribly wrong and the problem is just hidden by that check.
>
>Can you please remove the wait again and add a check of the r/b pin to 
>
>static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip, int state)
>{
>
>just before the 
>
>	return status;
>}
>  
>
The problem is in nand_wait, the function is called (when writting files 
to jffs2) with
chip->state=FL_READING and state=FL_WRITING and consequently the waiting
is terminated instantly (chip->state != state) leaving the chip in busy 
state.

savin
