Received: from pd953a752.dip.t-dialin.net ([217.83.167.82] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175tj4-0007xg-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 20:37:18 +0100
Message-Id: <200205091943.g49Jh4l22841@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "Darren Martz" <dmartz@shelbrook.com>, "'Russ Dill'" <Russ.Dill@asu.edu>
Subject: Re: Boot from DoC2000
Date: Thu, 9 May 2002 21:43:03 +0200
Cc: <linux-mtd@lists.infradead.org>
References: <002c01c1f77b$cc059300$9702a8c0@maverick>
In-Reply-To: <002c01c1f77b$cc059300$9702a8c0@maverick>
MIME-Version: 1.0
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

On Thursday, 9. May 2002 19:06, Darren Martz wrote:
> Russ,
>
> Thanks for the clarification, I didn't realize that JFFS/2 was the only
> unstable part. Being new to this, I'm trying to stick to as few patches
> as possible. I'll look into grub with nftl.
For further clarification, JFFS2 is not unstable. There's just no support for 
DOC. :)
-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
