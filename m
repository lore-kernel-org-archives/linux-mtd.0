Received: from pd9eb9d1b.dip.t-dialin.net ([217.235.157.27] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dpAV-0003Mc-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 09:05:35 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>, gleixner@autronix.de
Subject: Re: JFFS2 list_dirty corruption
Date: Thu, 21 Feb 2002 10:19:48 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02022021101508.18560@thomas> <02022020414807.18560@thomas> <28487.1014281949@redhat.com>
In-Reply-To: <28487.1014281949@redhat.com>
MIME-Version: 1.0
Message-Id: <0202211019480F.18560@thomas>
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

On Thursday, 21. February 2002 09:59, David Woodhouse wrote:

> Please could you confirm this also fixes the problem?

Yep, it does.

BTW: David, did you get my mail tonight? I had some strange notifications 
from my mailsystem.

-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
