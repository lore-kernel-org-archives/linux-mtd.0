Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFsnK-0005qR-U0
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2010 18:19:47 +0000
Received: by pwj8 with SMTP id 8so554872pwj.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Nov 2010 10:19:44 -0800 (PST)
Message-ID: <4CD990BC.6040800@gmail.com>
Date: Tue, 09 Nov 2010 10:19:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 09/10] mtd-utils: nanddump: type consistency
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
	<1288772847-8120-9-git-send-email-computersforpeace@gmail.com>
	<AANLkTinGe84r8mo84HQVikPqQxLrKnwrXa20E_rfN=0f@mail.gmail.com>
In-Reply-To: <AANLkTinGe84r8mo84HQVikPqQxLrKnwrXa20E_rfN=0f@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/9/2010 1:51 AM, Mike Frysinger wrote:
> On Wed, Nov 3, 2010 at 04:27, Brian Norris wrote:
>>  nandwrite.c |    6 +++---
> 
> the subject says "nanddump" ...

Oops, I'll change that if I send a "v2".

>> --- a/nandwrite.c
>> +++ b/nandwrite.c
>> @@ -262,7 +262,7 @@ int main(int argc, char * const argv[])
>>        long long blockstart = -1;
>>        struct mtd_dev_info mtd;
>>        struct mtd_oob_buf oob;
>> -       loff_t offs;
>> +       long long offs;
>>        int ret;
>>        int oobinfochanged = 0;
>>        struct nand_oobinfo old_oobinfo;
> 
> i dont think this is quite right.  "offs" is given to an ioctl which
> takes __kernel_loff_t ... we shouldnt assume "long long" and
> "__kernel_loff_t" are always the same.

This problem is sort of a "which comes first" question for me: I put
this patch before patch 10, where in patch 10, the ioctl in question is
replaced with an entirely different call to "mtd_is_bad".

In the new usage (patch 10), "mtd_is_bad" needs the eraseblock number as
an int, so there's some arithmetic going on ("offs" divided by ebsize)
that passes an int to "mtd_is_bad".

I was just trying to unify the usage of different 64-bit data types, and
after patch 10, there's no need to be using the "loff_t" type. However,
if it makes more sense, I can rearrange patch 9 and 10 such that the
type change comes after the ioctl is no longer called directly.

Thanks,
Brian
