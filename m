Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz7Ta-0004vL-HQ
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 12:34:07 +0000
Received: by ywi4 with SMTP id 4so1231242ywi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 05:34:05 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1285318249.29268.163.camel@localhost>
References: <1285238285.29268.28.camel@localhost>
	<1285272255-6980-1-git-send-email-vapier@gentoo.org>
	<1285318249.29268.163.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 24 Sep 2010 08:33:43 -0400
Message-ID: <AANLkTi=tXKi6AtBANE9T7OSENkkvwO64YpeKVqAhs0dD@mail.gmail.com>
Subject: Re: [PATCH v2] nandwrite: add --nobad to write bad blocks
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 24, 2010 at 04:50, Artem Bityutskiy wrote:
> On Thu, 2010-09-23 at 16:04 -0400, Mike Frysinger wrote:
>> Sometimes dumping bad blocks is useful, like when the block isn't actual=
ly
>> bad but the OOB layout isn't what the kernel is expecting or is otherwis=
e
>> screwed up. =C2=A0The --nobad option allows just that.
>>
>> v2
>> =C2=A0 =C2=A0 =C2=A0 - rename --nobad to --noskipbad
>
> Amended the comments and pushed, thanks.

oops ... thanks :)
-mike
