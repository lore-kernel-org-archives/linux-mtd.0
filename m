Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1BUr-0003SX-LX
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 05:15:58 +0000
Received: by iwn41 with SMTP id 41so2413325iwn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 22:15:56 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1285822785.11684.11.camel@localhost>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
	<1285822785.11684.11.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 30 Sep 2010 01:15:35 -0400
Message-ID: <AANLkTimzVA06P8GR4Gy_2PSFDXKnzTOHPj2qr+_X__zw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd-utils: new memory wrappers
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

On Thu, Sep 30, 2010 at 00:59, Artem Bityutskiy wrote:
> On Wed, 2010-09-29 at 19:30 -0400, Mike Frysinger wrote:
>> The mkfs.jffs2 program has local wrappers for memory related functions
>> that are useful beyond mkfs.jffs2, so break them out into a common heade=
r.
>> ---
>> =C2=A0include/common.h | =C2=A0 =C2=A08 +++++
>> =C2=A0include/xalloc.h | =C2=A0 80 +++++++++++++++++++++++++++++++++++++=
+++++++++++++++++
>> =C2=A0mkfs.jffs2.c =C2=A0 =C2=A0 | =C2=A0 41 ---------------------------
>> =C2=A03 files changed, 88 insertions(+), 41 deletions(-)
>> =C2=A0create mode 100644 include/xalloc.h
>>
>> diff --git a/include/common.h b/include/common.h
>> index 472315e..6e27d62 100644
>> --- a/include/common.h
>> +++ b/include/common.h
>> @@ -58,6 +58,9 @@ extern "C" {
>> =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "%s: error!: " fmt "\n", PROGRAM_NA=
ME, ##__VA_ARGS__); \
>> =C2=A0 =C2=A0 =C2=A0 -1; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> =C2=A0})
>> +#define errmsg_and_die(fmt, ...) do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 exit(errmsg(fmt, ##__VA_ARGS__)); =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +} while(0)
>>
>> =C2=A0/* System error messages */
>> =C2=A0#define sys_errmsg(fmt, ...) =C2=A0({ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> @@ -69,6 +72,9 @@ extern "C" {
>> =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "error %d (%s)\n", _err, strerror(_=
err)); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> =C2=A0 =C2=A0 =C2=A0 -1; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> =C2=A0})
>> +#define sys_errmsg_and_die(fmt, ...) do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 exit(sys_errmsg(fmt, ##__VA_ARGS__)); =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \
>> +} while(0)
>
> Often these funcs are used with longish strings, so it is better to try
> keeping the function names short. Thus, I suggest you to use
> 'err_msg_die()' etc. IOW, without the '_and' part.

as i'm sure you noticed, i didnt make these up.  i simply moved them
from existing mtd-utils code.

> If you are OK with this, I can just tweak your patch. But you can also
> re-send it - whatever you prefer.

since this cascades into another patch, i'll resubmit
-mike
