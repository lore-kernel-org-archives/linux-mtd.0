Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M9HJs-0003lL-G7
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 11:29:22 +0000
Received: by fxm8 with SMTP id 8so5301448fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 May 2009 04:29:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243240816.21646.102.camel@localhost.localdomain>
References: <1243232787-29108-1-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-2-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-3-git-send-email-corentincj@iksaif.net>
	<1243238323.21646.64.camel@localhost.localdomain>
	<71cd59b00905250123o516a293an3c5c541cc417fc94@mail.gmail.com>
	<1243240816.21646.102.camel@localhost.localdomain>
Date: Wed, 27 May 2009 13:29:14 +0200
Message-ID: <71cd59b00905270429q6b027f6cxbe32aba7e8c44b02@mail.gmail.com>
Subject: Re: [PATCH 2/2] mkfs.ubifs: use libubi to format UBI volume
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 25, 2009 at 10:40 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Mon, 2009-05-25 at 10:23 +0200, Corentin Chary wrote:
>> On Mon, May 25, 2009 at 9:58 AM, Artem Bityutskiy
>> <dedekind@infradead.org> wrote:
>> >
>> > I know this is nit-picking, but would be nicer to close libubi
>> > in case of errors. Namely, in the second and third checks.
>>
>> In case of error, close_target() will close libubi. (if(ubi) libubi_clos=
e(ubi)).
>> But maybe you want to explicitly close libubi here ?
>
> Ah, OK. NP then.
>
>> The comma is just at the 80 column limit.
>> Using Lindent, we get:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sys_err_msg("bad=
 root file-system directory '%s'",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 root);
>>
>> Is this ok ?
>
> I think you may just ignore the 80 chars limit and make it 81 chars :-)
>

I resended the patch, but it's moderated again (I used the
--in-reply-to feature), sorry.


--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
