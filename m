Received: from na3sys009aog126.obsmtp.com ([74.125.149.155])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qu39u-0006bg-4Q
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2011 14:01:23 +0000
Received: by mail-vx0-f178.google.com with SMTP id 19so1879036vxi.9
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Aug 2011 07:01:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313568224.20534.1.camel@sauron>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
	<e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
	<1313568224.20534.1.camel@sauron>
Date: Thu, 18 Aug 2011 10:01:16 -0400
Message-ID: <CAPcSpE+EhmRXn3Wv7TMAy7n_keTHoJQZHGhrQbKzAHpz5HsCkQ@mail.gmail.com>
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

On Wed, Aug 17, 2011 at 4:03 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-08-09 at 16:57 -0400, Ben Gardiner wrote:
>> The mtd_debug 'info' command reports a great deal of useful information about
>> the mtd device is it given for a query.
>>
>> Add the ECC size and OOB available to that list. The other entries in the
>> ecclayout struct are arrays and are not as meaningful as eccsize and oobavail.
>>
>> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>>
>> ---
>>
>> I noticed that the struct nand_ecclayout_user and its corresponding ioctl
>> has been marked deprecated; however, since this is a 'debug' utility and at
>> least one person found it useful I thought it would be a good idea to propose
>> these changes anyways.
>
> I think we could just kill depricated ioctls as soon as we make
> mtd-utils stop using them. If you add this dependency - it will be more
> difficult to kill them.

Fair enough -- I'm happy to hear a definitive answer; thank you, Artem.

In PATCH 3/3 I use the same ioctl to get the ECC size for the purposes
of producing a BER estimate. What is the right way of getting the ECC
size now that ECCGETLAYOUT is deprecated? Is this even something that
should be from userspace at all?

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
