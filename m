Received: from pd9eb89fc.dip.t-dialin.net ([217.235.137.252] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eIkZ-0006By-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 16:40:47 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Adam Wozniak <adam.wozniak@comdev.cc>, Simon Gittins <gittins@tabq.com.au>
Subject: Re: jffs2 dirty_list corruption
Date: Fri, 22 Feb 2002 17:54:50 +0100
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
References: <696BA06B3A0FD211BAAD0060B0C4DD8301B73185@wntx.tabq.com> <3C766D8A.FEE8665C@comdev.cc>
In-Reply-To: <3C766D8A.FEE8665C@comdev.cc>
MIME-Version: 1.0
Message-Id: <0202221754501M.18560@thomas>
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

On Friday, 22. February 2002 17:10, Adam Wozniak wrote:
> Simon Gittins wrote:
> > The first patch (Thomas) didn't help,
> > but the second (thanks David) seems to work for me.
>
> Did I miss a patch?
>
> The only one I saw was the one from Thomas.
Yes, David made a different solution. It's on the list and in CVS in meantime
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
