Received: from nm14-vm0.bullet.mail.ird.yahoo.com ([77.238.189.193])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S39xQ-0001bC-Jp
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 17:38:25 +0000
Message-ID: <1330623502.1881.YahooMailClassic@web29011.mail.ird.yahoo.com>
Date: Thu, 1 Mar 2012 17:38:22 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <1330622530.76119.YahooMailClassic@web29018.mail.ird.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Thu, 1/3/12, Paul Parsons <lost.distance@yahoo.com> wrote:=0A> It se=
ems to me that waiting for SR[7:6]=3D00 instead of just=0A> SR.6=3D0 would:=
=0A> 1. Have the same outcome.=0A> 2. Be strictly within spec; SR[7:6] have=
 been cleared=0A> therefore the Erase=0A> Resume command has been accepted.=
=0A=0AActually on second thoughts maybe not: if the erase has actually comp=
leted=0Awhen we issue an Erase Resume command then SR.7 should read back as=
 1 and we=0Aend up looping forever. hmm...
