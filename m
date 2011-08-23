Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QveTL-0007nb-73
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 00:04:03 +0000
Received: by wyh11 with SMTP id 11so4737075wyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 17:04:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314003384.2644.85.camel@sauron>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-6-git-send-email-computersforpeace@gmail.com>
	<1314003384.2644.85.camel@sauron>
Date: Mon, 22 Aug 2011 17:04:00 -0700
Message-ID: <CAN8TOE9kZa5g9baQ63ojUYK7uqrwA9GEf_6oYz1S-kacZRq+5Q@mail.gmail.com>
Subject: Re: [RFC 5/5] mtd: add MEMWRITEDATAOOB ioctl
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 22, 2011 at 1:56 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =3D memdup_user(
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (void __user *)(uintptr_t)buf.usr_ptr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ops.len + ops.ooblen);
>
> I'd introduced a local variable for buf.usr_ptr and made the formatting
> nicer.

Sure. Will incorporate into v2.

>> +struct mtd_data_oob_buf {
>
> Let's add some reserved space for future improvements - I think it is
> always a good idea to do for ioctls:
>
> + __u8 padding[8]

OK. Will consider for v2.

>> +#define MEMWRITEDATAOOB =A0 =A0 =A0 =A0 =A0 =A0 =A0_IOWR('M', 24, struc=
t mtd_data_oob_buf)
>
> Would be greate to add a short comment about what this ioctl does. Of
> course you can optionally do this for all of them, but at least for the
> new one it does not hurt to have.

Sure, will do. I'll probably add at least a few comments in the header
for all the relevant ioctls we've been discussing, but that'll wait
until we've finished the code.

BTW, I'm considering splitting the usr_ptr into separate buffers for
data and oob. This will probably be a little easier for the user
interface as well as for internal kernel operations. Anyway, the
resulting struct is looking more and more like the existing `struct
mtd_oob_ops' (this is kind of by design); is it still a good idea to
keep the user-facing struct independent of the internal mtd_oob_ops
struct? I'm thinking it would leave some flexibility for the future.

Brian
