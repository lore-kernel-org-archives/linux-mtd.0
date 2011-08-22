Received: from na3sys009aog123.obsmtp.com ([74.125.149.149])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvUHw-00068b-Uy
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 13:11:38 +0000
Received: by mail-vx0-f176.google.com with SMTP id 17so6127595vxh.21
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 06:11:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314010839.2644.116.camel@sauron>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
	<e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
	<1313568224.20534.1.camel@sauron>
	<CAPcSpE+EhmRXn3Wv7TMAy7n_keTHoJQZHGhrQbKzAHpz5HsCkQ@mail.gmail.com>
	<1314010839.2644.116.camel@sauron>
Date: Mon, 22 Aug 2011 09:11:32 -0400
Message-ID: <CAPcSpEJE24eYuvcZSoCeobGxTxWXh5UhWsRanmCJZ+ZPBGM5=A@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd_debug: report ecc layout
From: Ben Gardiner <bengardiner@nanometrics.ca>
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

On Mon, Aug 22, 2011 at 7:00 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-08-18 at 10:01 -0400, Ben Gardiner wrote:
>> Fair enough -- I'm happy to hear a definitive answer; thank you, Artem.
>>
>> In PATCH 3/3 I use the same ioctl to get the ECC size for the purposes
>> of producing a BER estimate. What is the right way of getting the ECC
>> size now that ECCGETLAYOUT is deprecated? Is this even something that
>> should be from userspace at all?
>
> I do not know. I think we need to expose it via sysfs. I think that in
> general sysfs is better that "informational" ioctls.

Ok -- I've heard that said before and for what it's worth I agree --
sysfs is better.

However, I'm seeing that there is no available sysfs mechanism at
present. I'm sorry but I can't take on the time to introduce one
although I agree it is best and I would like to be able to.

Please drop patches 1/3 and 3/3 from consideration. Patch 2/3 'print
number of bits corrected during test' is still useful and applicable
to mtd-utils -- IMHO.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
