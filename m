Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvSDQ-0003me-Nc
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 10:58:49 +0000
Received: by yxk8 with SMTP id 8so4185978yxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 03:58:47 -0700 (PDT)
Subject: Re: [PATCH 1/3] mtd_debug: report ecc layout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Date: Mon, 22 Aug 2011 14:00:35 +0300
In-Reply-To: <CAPcSpE+EhmRXn3Wv7TMAy7n_keTHoJQZHGhrQbKzAHpz5HsCkQ@mail.gmail.com>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
	<e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
	<1313568224.20534.1.camel@sauron>
	<CAPcSpE+EhmRXn3Wv7TMAy7n_keTHoJQZHGhrQbKzAHpz5HsCkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314010839.2644.116.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-08-18 at 10:01 -0400, Ben Gardiner wrote:
> Fair enough -- I'm happy to hear a definitive answer; thank you, Artem.
> 
> In PATCH 3/3 I use the same ioctl to get the ECC size for the purposes
> of producing a BER estimate. What is the right way of getting the ECC
> size now that ECCGETLAYOUT is deprecated? Is this even something that
> should be from userspace at all?

I do not know. I think we need to expose it via sysfs. I think that in
general sysfs is better that "informational" ioctls.

-- 
Best Regards,
Artem Bityutskiy
