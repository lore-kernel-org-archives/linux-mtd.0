Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GgOh-0005nF-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2001 13:04:36 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Map driver usage
Date: Wed, 19 Dec 2001 14:16:08 +0100
References: <Pine.LNX.4.21.0112181832140.3242-100000@dagobert.svc.sysgo.de> <20544.1008697534@redhat.com>
In-Reply-To: <20544.1008697534@redhat.com>
Cc: linux-mtd@lists.infradead.org,
   =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
   Aleksander Sanochkin <asanochkin@Lnxw.COM>
MIME-Version: 1.0
Message-Id: <01121914160800.03136@rob>
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

Hi David,

I just looked at Aleksander Sanochkin's code as Jörn suggested. It looks as if
it indeed implements just what I need for my mapping driver. (Actually it 
implements quite a few more things, I only need support for partitions that 
are not physically contiguous). I see that his code has not made it into the  
MTD CVS so far. Is that because you have objections ? I would really like to 
build on this stuff in my mapping driver.

Cheers

Rob

-- 
----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
