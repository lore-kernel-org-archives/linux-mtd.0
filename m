Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtMas-0004h6-6G
 for linux-mtd@lists.infradead.org; Fri, 15 May 2015 20:52:30 +0000
Received: by iebgx4 with SMTP id gx4so129991538ieb.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 May 2015 13:52:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150515200253.GM11598@ld-irv-0074>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <5554DF5E.4020802@wwwdotorg.org>
 <CAMuHMdW6bDjEx+EkqLQmGCZTap-77w2wWiHpra+2pLPexwAWPw@mail.gmail.com>
 <20150515200253.GM11598@ld-irv-0074>
Date: Fri, 15 May 2015 22:52:08 +0200
Message-ID: <CACna6rwxiAXffy8AdOnQb7QbNOoknJUqiLHRw8WWisW8jpzRnw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec, spi-nor"
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marek Vasut <marex@denx.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Stephen Warren <swarren@wwwdotorg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Kumar Gala <galak@codeaurora.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 May 2015 at 22:02, Brian Norris <computersforpeace@gmail.com> wrote:
> Thanks all. I see that I've gotten an ack from Mark as well (thanks!),
> so I'll apply this (plus the fixup I just sent) to linux-mtd.git and
> probably pullreq it before the weekend is over. I'll assume Rafal and
> Geert will take care of following up on their DTS submissions that added
> "nor-jedec", but let me know if you'd rather me take care of it. I'll
> try to keep an eye open as we get nearer to the next merge window, to
> make sure the wrong entries don't get through.

Sure, I will (Cc-ing linux-mtd).

--=20
Rafa=C5=82
