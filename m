Received: from pd9eb987a.dip.t-dialin.net ([217.235.152.122] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fPsj-0003ep-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 18:29:50 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Radu Corlan <rcorlan@pcnet.ro>
Subject: Re: problem in nand.c v 1.16
Date: Mon, 25 Feb 2002 19:44:32 +0100
References: <Pine.LNX.4.10.10202252006450.731-100000@pinot.profis.ro>
In-Reply-To: <Pine.LNX.4.10.10202252006450.731-100000@pinot.profis.ro>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Message-Id: <0202251944320H.03406@thomas>
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

On Tuesday, 26. February 2002 02:11, Radu Corlan wrote:
> I'm using the nand driver with a Toshiba TC58256 flash chip. We have found
> that the delay at the end of nand_command (currently 15us) is not enough
> for this part (the datasheet calls for 25us). Before making the change, we
> got a 0xff instead of the first byte of the page.
> Please take this into account in the next revision.

Please keep such discussions on the mailing-list !

Maybe we can solve it with a additional entry in the nand_chip structure.
		
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
