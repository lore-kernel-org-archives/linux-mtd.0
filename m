Received: from river-bank.demon.co.uk ([62.49.20.162] helo=badger.river-bank.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dVyw-000404-01
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2003 13:40:54 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Phil Thompson <phil@river-bank.demon.co.uk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 Format Documentation?
Date: Tue, 28 Jan 2003 14:11:46 +0000
Cc: linux-mtd@lists.infradead.org
References: <20030128132344.GA7618@wohnheim.fh-wedel.de> <200301281235.27066.phil@river-bank.demon.co.uk> <9649.1043761486@passion.cambridge.redhat.com>
In-Reply-To: <9649.1043761486@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200301281411.46041.phil@river-bank.demon.co.uk>
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

On Tuesday 28 January 2003 1:44 pm, David Woodhouse wrote:
> phil@river-bank.demon.co.uk said:
> > David's paper is a good start but I was after a lower level of detail=
=2E
> > I need  something from which I can implement a JFFS2 reader from
> > scratch (ie. without  any GPL code).
>
> The on-medium format is very simple. The actual layout of the existing =
node
> types is detailed in full in include/linux/jffs2.h. In conjunction with=
 the
> theory of operation described in the paper, these should be perfectly
> sufficient.
>
> What exactly are you trying to achieve? Simple read-only operation or a
> fully-functional compatible file system?

I need to modify a bootloader to load the kernel from a JFFS2 filesystem =
- so=20
a simple read is all that is needed. Unfortunately the bootloader doesn't=
=20
have a license that is compatible with the GPL.

Phil
