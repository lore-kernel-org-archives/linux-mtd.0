Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MPeuR-0003as-3w
	for linux-mtd@lists.infradead.org; Sat, 11 Jul 2009 15:54:50 +0000
Received: by fxm5 with SMTP id 5so2685fxm.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jul 2009 08:54:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
References: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
Date: Sat, 11 Jul 2009 19:54:40 +0400
Message-ID: <acd2a5930907110854m2dc0e259mf0a93264ea14cea3@mail.gmail.com>
Subject: Re: UBIFS Question
From: Vitaly Wool <vitalywool@gmail.com>
To: "Laurent ." <sid6582@msn.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, artem.bityutski@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Laurent,

On Fri, Jul 10, 2009 at 10:43 PM, Laurent .<sid6582@msn.com> wrote:
>
> Hi Artem,
>
> I am currently working on an embedded Linux project which has an ARM9 chi=
p (NXP=92s 180MHz LPC3131) with a NAND Flash controller which supports 5bit=
s or 8bits HW ECC.
> I have a 256MB SLC NAND and run Linux 2.6.28.2

FWIW, why don't you come up with the patches to the mainline which add
support for this chip? It would have been easier to help you if you
did so.

~Vitaly
