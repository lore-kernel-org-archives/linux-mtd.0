Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1autRD-0007aT-3w
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 03:13:24 +0000
Received: by mail-wm0-x236.google.com with SMTP id n3so8692396wmn.0
 for <linux-mtd@lists.infradead.org>; Mon, 25 Apr 2016 20:13:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1461622409-14970-1-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
Date: Tue, 26 Apr 2016 00:13:01 -0300
Message-ID: <CAAEAJfDQvN46HdqWAHVY+xk+=Y-Cs_LapN1kBC14CH=WObEK8A@mail.gmail.com>
Subject: Re: [RFC] Porting kernel MTD tests to user space
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 April 2016 at 19:13, Richard Weinberger <richard@nod.at> wrote:
> David was so kind and did an initial port of Linux's MTD tests to user sp=
ace.
> He took most tests as-is and massaged them to work in user space using li=
bmtd.
> In the long run the goal is giving up the kernel tests as much as possibl=
e
> and improve the tests present in mtd-utils.
>
> Feedback is very welcome!
>

I think this is great, and it will be great to test NAND/NOR devices easier=
.

The autoconf patch looked also great, but for some reason it
stalled, so... what do we need to do to prevent this one from stalling as w=
ell?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
