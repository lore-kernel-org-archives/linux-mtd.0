Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkKnp-00057J-GY
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 10:00:03 -0400
Subject: Re: [PATCH] UBI: dereference after kfree in create_vtbl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Satyam Sharma <satyam.sharma@gmail.com>
In-Reply-To: <a781481a0705050648l19b316acyf3d52b0545e18344@mail.gmail.com>
References: <463A04A5.5030103@gmail.com>
	<a781481a0705041442h37453fb6k26d04eb5356e9dc0@mail.gmail.com>
	<463BC019.40305@gmail.com>
	<a781481a0705042055u5e9ba060w95da83b0fbeff76a@mail.gmail.com>
	<1178351711.3659.54.camel@sauron>
	<a781481a0705050526r13445d60j737a6c2015402dcc@mail.gmail.com>
	<1178371103.3659.115.camel@sauron>
	<a781481a0705050648l19b316acyf3d52b0545e18344@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 05 May 2007 16:59:22 +0300
Message-Id: <1178373562.3659.144.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Florin Malita <fmalita@gmail.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-05-05 at 19:18 +0530, Satyam Sharma wrote:
> Well, you're developing / maintaining this right now, so it's your
> call. Though I bet most people would find keeping that list_add_tail
> local to scan.c more tasteful.

I do not think so. If you are interested, try to find "UBI take 2"
patches in lkml. Look how it looked liked. It consisted of many
independent units and units could access other units _only_ via
interfaces. I would do what you say there.

Read Teo's comments - I actually now agree with them. And after I had
changed UBI i got rid of several thousands lines of code, and the code
became simpler.

So, my argument is:
1. It makes no sense to introduce one more non-static function to _just_
encapsulate list_add_tail and _just_ for one caller.
2. It is _C_, it is _kernel_, and it is OK sometimes _not_ to follow
computer since rules.

> I wish you'd commented it better than "This function returns zero in
> case of success and a negative error code in case of failure." in that
> case :-)
Agreed, I'll add more comments, thanks.

> Again, you're developing and maintaining this right now, so it's your
> call. Though it would be easier on you if you remove these exceptions
> that could be quite easily removed, actually.
I do not see any nice way to do this. If you suggest one, I will do.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
