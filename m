Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jrdho-0003iv-Fo
	for linux-mtd@lists.infradead.org; Thu, 01 May 2008 18:40:32 +0000
Received: by fg-out-1718.google.com with SMTP id e21so769930fga.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 01 May 2008 11:40:31 -0700 (PDT)
Message-ID: <1fe498980805011140s67e6d82p607f6710db375490@mail.gmail.com>
Date: Thu, 1 May 2008 14:40:31 -0400
From: "Dave Bender" <codehero@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: AMD/Fujitsu erase-suspend-program brokenness
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear list,
  I am working on a custom board with a CFI compliant Spansion
S29GL512 NOR flash chip. The linux driver in 2.6.24.5 does not seem to
support erase-suspend-program. Should I be using a different driver or
is there a way to enable this functionality?

Dave
