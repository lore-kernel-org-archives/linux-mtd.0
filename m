Received: from gateway-1237.mvista.com ([63.81.120.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jk1qC-0007yI-VF
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 18:49:46 +0000
From: Jean Pihet <jpihet@mvista.com>
To: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions
	=?iso-8859-1?q?causes=09kernel?= panic
Date: Thu, 10 Apr 2008 20:51:40 +0200
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<200804101918.21362.jpihet@mvista.com>
	<018a01c89b39$9a2b4fb0$ce81ef10$@Tjernlund@transmode.se>
In-Reply-To: <018a01c89b39$9a2b4fb0$ce81ef10$@Tjernlund@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804102051.41101.jpihet@mvista.com>
Cc: nickpiggin@yahoo.com.au, 'Alexey Korolev' <akorolev@infradead.org>,
	joern@logfs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jocke,

> Is this in Linus tree too?
No, it isn't.
2.6.24 JFFS2 as such is pretty unstable.

Jean
