Received: from pd9eb9fe6.dip.t-dialin.net ([217.235.159.230] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16b5gC-00039q-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 20:07:00 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Lance Nakamura <LANCE_N@VERIFONE.COM>,
   David Woodhouse <dwmw2@infradead.org>
Subject: Re: NAND flash and JFFS(2)
Date: Wed, 13 Feb 2002 21:19:47 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <03F65384200AD111936B0060B067AC7B030912AA@HNL-NT-MAIL1.verifone.com>
In-Reply-To: <03F65384200AD111936B0060B067AC7B030912AA@HNL-NT-MAIL1.verifone.com>
MIME-Version: 1.0
Message-Id: <0202132119470Z.00764@thomas>
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

On Wednesday, 13. February 2002 21:03, Lance Nakamura wrote:
> 2 things:
> 1) can the test be set to remove power more frequently,
>    as in every minute rather than every hour?  our experience with
>    power fail safety is that you have to run at least 100K cycles,
>
> 2) an important test is to remove power while the file
>    system is trying to recover.  in the real world, power failures
>    are rarely clean, isolated instances.  you may get multiple failures in
>    as little as 1 second (failures a few hundred miliseconds apart).
You're right, but this was a test for a big hack inside the fs.
The power on/off was just a little addon. If we have finished some left 
issues i will setup a real power fail safety test.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
