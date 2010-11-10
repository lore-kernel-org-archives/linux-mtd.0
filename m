Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFy7h-0008Dh-As
	for linux-mtd@lists.infradead.org; Wed, 10 Nov 2010 00:01:14 +0000
Received: by eyd9 with SMTP id 9so28215eyd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Nov 2010 16:01:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CD990BC.6040800@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
	<1288772847-8120-9-git-send-email-computersforpeace@gmail.com>
	<AANLkTinGe84r8mo84HQVikPqQxLrKnwrXa20E_rfN=0f@mail.gmail.com>
	<4CD990BC.6040800@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 9 Nov 2010 19:00:43 -0500
Message-ID: <AANLkTimUr8Dvmz7=Owk9dEgWt7hdTFFT+NDXczWd9DfV@mail.gmail.com>
Subject: Re: [PATCH 09/10] mtd-utils: nanddump: type consistency
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Jehan Bing <jehan@orb.com>,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 9, 2010 at 13:19, Brian Norris wrote:
> On 11/9/2010 1:51 AM, Mike Frysinger wrote:
>> On Wed, Nov 3, 2010 at 04:27, Brian Norris wrote:
>>> --- a/nandwrite.c
>>> +++ b/nandwrite.c
>>> @@ -262,7 +262,7 @@ int main(int argc, char * const argv[])
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0long long blockstart =3D -1;
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_dev_info mtd;
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_oob_buf oob;
>>> - =C2=A0 =C2=A0 =C2=A0 loff_t offs;
>>> + =C2=A0 =C2=A0 =C2=A0 long long offs;
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int oobinfochanged =3D 0;
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_oobinfo old_oobinfo;
>>
>> i dont think this is quite right. =C2=A0"offs" is given to an ioctl whic=
h
>> takes __kernel_loff_t ... we shouldnt assume "long long" and
>> "__kernel_loff_t" are always the same.
>
> This problem is sort of a "which comes first" question for me: I put
> this patch before patch 10, where in patch 10, the ioctl in question is
> replaced with an entirely different call to "mtd_is_bad".
>
> In the new usage (patch 10), "mtd_is_bad" needs the eraseblock number as
> an int, so there's some arithmetic going on ("offs" divided by ebsize)
> that passes an int to "mtd_is_bad".
>
> I was just trying to unify the usage of different 64-bit data types, and
> after patch 10, there's no need to be using the "loff_t" type. However,
> if it makes more sense, I can rearrange patch 9 and 10 such that the
> type change comes after the ioctl is no longer called directly.

i'd leave the type unchanged when using the ioctl() and change it only
when moving to a different API
-mike
