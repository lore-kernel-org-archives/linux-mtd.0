Received: from mail.rdsor.ro ([193.231.238.10])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Csfi3-0007Y8-96
	for linux-mtd@lists.infradead.org; Sun, 23 Jan 2005 06:15:18 -0500
From: Balint Cristian <rezso@rdsor.ro>
To: linux-mtd@lists.infradead.org
Date: Sun, 23 Jan 2005 13:15:04 +0200
References: <20050123103642.944BF38003@smtp1-2-sn3.vrr.skanova.net>
In-Reply-To: <20050123103642.944BF38003@smtp1-2-sn3.vrr.skanova.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200501231315.04773.rezso@rdsor.ro>
Cc: 
Subject: Re: A few questions about diskonchip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 23 January 2005 12:37, Torbj=F6rn Jansson wrote:

> I can get the old doc2001plus module to load and detect the chip (2
> modifications requierd), but when i cat from /dev/mtdblock0 the resulting
> data doesn't match a dump of the rom i have on file.
> For example, one string in /dev/mtdblock reads "Cyrht" but it shoud be
> "Copyright" so it looks like the module is reading 32bits and throwing aw=
ay
> 16 or something like that.

 Same problem here. Just to know.
