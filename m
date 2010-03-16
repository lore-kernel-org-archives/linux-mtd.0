Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NrcHk-0005nR-Ii
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 19:18:41 +0000
Received: by fg-out-1718.google.com with SMTP id e12so70221fga.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Mar 2010 12:18:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ljdsibqe.fsf@macbook.be.48ers.dk>
References: <87vdcwv139.fsf@tac.ki.iif.hu> <87ljdsibqe.fsf@macbook.be.48ers.dk>
Date: Tue, 16 Mar 2010 22:18:31 +0300
Message-ID: <acd2a5931003161218id7b0c4bp3b6dc366e4e56d5d@mail.gmail.com>
Subject: Re: RFC: direct MTD support for SquashFS
From: Vitaly Wool <vitalywool@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-embedded@vger.kernel.org,
	Phillip Lougher <phillip@lougher.demon.co.uk>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, Ferenc Wagner <wferi@niif.hu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 16, 2010 at 5:26 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Ferenc" =3D=3D Ferenc Wagner <wferi@niif.hu> writes:
> =A0Ferenc> For now, 2.6.34 gained pluggable decompressors, so this patch
> =A0Ferenc> does not apply anymore, though the main idea holds. =A0My
> =A0Ferenc> questions: is the community interested in integrating somethin=
g
> =A0Ferenc> like this, should this patch transformed into something
> =A0Ferenc> acceptable, or am I a total lunatic? =A0I don't know a thing
> =A0Ferenc> about filesystem development, but willing to learn and
> =A0Ferenc> refactor. =A0Comments welcome.
>
> Nice, I have been thinking about that as well. What kind of size savings
> are you getting with this?

Yeah, I'm interested in that as well.

~Vitaly
