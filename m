Received: from yx-out-1718.google.com ([74.125.44.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LqAtv-0000dN-O1
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 18:47:38 +0000
Received: by yx-out-1718.google.com with SMTP id 34so984233yxf.72
	for <linux-mtd@lists.infradead.org>;
	Sat, 04 Apr 2009 11:47:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090404143848.GA13480@turtle.localnet>
References: <20090404143848.GA13480@turtle.localnet>
Date: Sat, 4 Apr 2009 14:47:30 -0400
Message-ID: <8bd0f97a0904041147l3b354ccai1c9918122969d38b@mail.gmail.com>
Subject: Re: [PATCH] Fix erase timeout in M25P80 driver
From: Mike Frysinger <vapier.adi@gmail.com>
To: Peter Horton <zero@colonel-panic.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, tbm@cyrius.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 4, 2009 at 10:38, Peter Horton wrote:
> + =C2=A0 =C2=A0 =C2=A0 for (deadline =3D jiffies + MAX_READY_WAIT_JIFFIES=
; !time_after_eq(jiffies, deadline);) {

this would make more sense as a while loop:
  deadline =3D jiffies + MAX_READY_WAIT_JIFFIES;
  while (!time_after_eq(jiffies, deadline)) {
maybe even more sense as a do { ... } while (...) ...

a for loop just looks weird ... but it should do what you want, so whatever
-mike
