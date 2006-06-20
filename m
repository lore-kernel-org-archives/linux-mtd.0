Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsgRW-0003j1-4P
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 09:39:08 -0400
Message-ID: <4497FCA4.1060601@epico.si>
Date: Tue, 20 Jun 2006 15:48:20 +0200
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
In-Reply-To: <1150809682.6780.172.camel@localhost.localdomain>
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

>This gets even more mysterious. I both cases the previous function was
>nand_wait(), which blocks in the wait function until ready state is
>reached. 
>
>I really have no clue, how the chip gets into busy state between the
>return from nand_wait() and the next commmand. 
>
>Is there anything playing with the enable pin of the nand chip between
>those commands ? Those chips have an autoread feature on power on. Is
>the power switched off ?
>  
>
No.

>Have you any other modifications to at91_nand.c I'm not aware of ?
>  
>
No.

I've pinpointed the location to the command switch at the end of 
nand_command fn:

        switch (command) {

        case NAND_CMD_PAGEPROG:
        case NAND_CMD_ERASE1:
        case NAND_CMD_ERASE2:
        case NAND_CMD_SEQIN:
        case NAND_CMD_STATUS:
                chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE);
^^^^^^^^^^^^^
if I wait for ready at this point then I can copy files to jffs2 
partition on my
nand without problems (...well as far as I can tell from a short test...).

savin
