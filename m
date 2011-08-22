Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvcH5-0005W2-VH
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 21:43:16 +0000
Received: by wyh11 with SMTP id 11so4662276wyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 14:43:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314003028.2644.80.camel@sauron>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-5-git-send-email-computersforpeace@gmail.com>
	<1314003028.2644.80.camel@sauron>
Date: Mon, 22 Aug 2011 14:43:12 -0700
Message-ID: <CAN8TOE97XijzxpdjF4MHMzGhoAYw7VaLaYSD-HEP-UYUUCf13w@mail.gmail.com>
Subject: Re: [RFC 4/5] mtd: move mtd_oob_mode_t to shared kernel/user space
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

On Mon, Aug 22, 2011 at 1:50 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
>> +typedef enum {
>> + =A0 =A0 MTD_OOB_PLACE,
>> + =A0 =A0 MTD_OOB_AUTO,
>> + =A0 =A0 MTD_OOB_RAW,
>> +} mtd_oob_mode_t;
>
> Could we get rid of this typedef and use anonymous enum instead:
>
> enum {
> =A0 =A0 =A0 =A0A,
> =A0 =A0 =A0 =A0B,
> };
>
> Indeed, we do not need it, and we do not want to pollute the user-space
> namespaces unnecessarily.

Well, we do *use* the typedef in a few kernel structs, and we will use
it in user space as well. So we may run into issues with 32-bit vs.
64-bit integers if we just stick with an int-based type, right?

Also, I'm pondering the question: do we need to worry about the
underlying numbering for such an enum? I believe there it is
theoretically possible for different compilers to choose a different
numbering scheme, potentially making user-compiled software
incompatible with the internal kernel binary. Perhaps to be safe we
could just do:

enum {
     MTD_OOB_PLACE =3D 0,
     MTD_OOB_AUTO =3D 1,
     MTD_OOB_RAW =3D 2,
};

Or instead, maybe we should just switch to a __u32 type and some #defines..=
.

Sorry if this is a lot of thinking out loud here :)

Brian
