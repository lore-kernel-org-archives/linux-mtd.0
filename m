Received: from pd9e413bf.dip.t-dialin.net ([217.228.19.191] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fhgw-000503-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 13:30:50 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Radu Corlan <rcorlan@pcnet.ro>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: Support for parallel access in nand chips
Date: Tue, 26 Feb 2002 14:45:37 +0100
Cc: linux-mtd@lists.infradead.org, Joerg Zastrau <dl1bku@amsat.org>
References: <Pine.LNX.4.10.10202261415120.706-100000@pinot.profis.ro>
In-Reply-To: <Pine.LNX.4.10.10202261415120.706-100000@pinot.profis.ro>
MIME-Version: 1.0
Message-Id: <0202261445370B.10190@thomas>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tuesday, 26. February 2002 21:24, Radu Corlan wrote:
> But nftl_format complains that the erase size is not 0x2000; Is there a
> newer version than 1.17?
You don't need NTFL on top of it. Just use JFFS2. There are some 
modifications neccecary fo the ECC layout. 

Radu: Can you send me your actual code, then I can give you some pointers

-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
