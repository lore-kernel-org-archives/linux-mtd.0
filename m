Received: from nm15-vm1.bullet.mail.ird.yahoo.com ([77.238.189.194])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScJ4i-0007bI-1r
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 16:27:12 +0000
Message-ID: <1339000030.17721.YahooMailClassic@web29003.mail.ird.yahoo.com>
Date: Wed, 6 Jun 2012 17:27:10 +0100 (BST)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH 2/2] UBIFS: fix debugfs-less systems support
To: Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <1338988149-5183-2-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Wed, 6/6/12, Artem Bityutskiy <dedekind1@gmail.com> wrote:=0A> Commi=
t "f70b7e5 UBIFS: remove Kconfig debugging option"=0A> broke UBIFS and it=
=0A> refuses to initialize if debugfs (CONFIG_DEBUG_FS) is=0A> disabled. I =
incorrectly=0A> assumed that debugfs files creation function will return=0A=
> success if debugfs=0A> is disabled, but they actually return -ENODEV. Thi=
s patch=0A> fixes the issue.=0A> =0A> Signed-off-by: Artem Bityutskiy <arte=
m.bityutskiy@linux.intel.com>=0A=0AThanks Artem!=0A=0AThis patch series wor=
ks for me on linux-3.5.0-rc1.=0A=0ATested-by: Paul Parsons <lost.distance@y=
ahoo.com>
