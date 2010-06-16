Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOoM1-0002Ty-PH
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2010 08:52:14 +0000
Received: by vws15 with SMTP id 15so915079vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Jun 2010 01:52:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1276669357.19028.280.camel@localhost>
References: <AANLkTimuYmRDCZCkoB9YHifngCwjp9_B2ucFQ1seaiM9@mail.gmail.com>
	<1274595417.8881.36.camel@localhost.localdomain>
	<1276669357.19028.280.camel@localhost>
Date: Wed, 16 Jun 2010 14:22:12 +0530
Message-ID: <AANLkTim9DUdPdqqpXqrH9n7RqXrb9VTyc3AT36Kk6Wf7@mail.gmail.com>
Subject: Re: [PATCH] UBI: fix delete compatible internal volume scan
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
On Wed, Jun 16, 2010 at 11:52 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2010-05-23 at 09:16 +0300, Artem Bityutskiy wrote:
>> On Tue, 2010-05-18 at 23:10 +0530, Brijesh Singh wrote:
>> > This patch resolves a possible bug. Scan is adding delete compatible
>> > blocks to both corr list and used list.
>> > It should return after adding the block to corr list.
>> >
>> > Signed-off-by: Brijesh Singh <brijesh.s.singh@gmail.com>
>>
>> I'm not sure this patch is enough. I think we should add a 'compat' flag
>> to the 'struct ubi_mkvol_req' structure, to make it possible to create
>> volumes with different compatibility flags. Then we need to write a test
>> and add it to the UBI test-suite at 'mtd-utils/tests/ubi-tests/'.
>
> Ok, that was nonsense. First of all, compatibility flags are applicable
> only for internal volumes, and we do not want to allow users creating
> internal volumes, even for testing.
>
> Secondly, your patch is right.
>
> Thirdly, even without your patch everything works just fine, because
> even though we also add this PEB to the used tree, we'll never ever use
> it, so it will not cause problems.
I created internal delete compatible volume. My assumption was that
this volume gets deleted in older versions of UBI. So, UBI should not
add this PEB to used tree. Please correct me if my assumption is
wrong.
I have one question: Should UBI ensure that delete compatible volume
is deleted? If yes, should these erase blocks be deleted at
initialization (not lazily)?
> Thus, I'll just apply your patch, thank you.
>
>> Then once we have tested and fixed this, we should merge this and also
>> send to the '-stable' trees.
>
> And not need to send it to '-stable'.
>
>> I remember I did give the compat option a test, but probably not that
>> good.
>
> They actually seem to work fine.

Thanks,
Brijesh
