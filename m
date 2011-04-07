Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7rOu-0000F8-Le
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 15:45:41 +0000
Received: by gwb1 with SMTP id 1so957918gwb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 08:45:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTimf4kr+2_AaU3Eo3j=6Pu5e1KgJOA@mail.gmail.com>
References: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
	<BANLkTimf4kr+2_AaU3Eo3j=6Pu5e1KgJOA@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 7 Apr 2011 11:45:19 -0400
Message-ID: <BANLkTi=8iP-J6sqt6M8gQCb9czNpHt3u8w@mail.gmail.com>
Subject: Re: [PATCH] flashcp: improve speed & some clean ups
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 7, 2011 at 11:38, Leon Woestenberg wrote:
> On Thu, Apr 7, 2011 at 5:04 PM, Frans Meulenbroeks wrote:
>> +static int compare(unsigned char *src, unsigned char *dst, ssize_t len)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 int rv =3D 0;
>> + =C2=A0 =C2=A0 =C2=A0 unsigned long long *sp =3D (unsigned long long *)=
src;
>> + =C2=A0 =C2=A0 =C2=A0 unsigned long long *dp =3D (unsigned long long *)=
dst;
>> +
>
> Dangerous on platforms that do not support non-natural alignments (ARM is=
 one).
>
> Unless the alignment rules are enforced elsewhere?

i dont think they are.  looking at this code though, seems like it
could be solved without needing to use 64/128 bit types and ugly
casts.  i feel like it could be done with a clever memcmp or memchr or
memmem.
-mike
