Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKYgn-0000RV-Qh
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 13:43:18 +0000
Received: by bwz5 with SMTP id 5so18486313bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 05:43:16 -0800 (PST)
Message-ID: <71cd59b00901070540t7dcac146m53bb798fb20aaa9c@mail.gmail.com>
Date: Wed, 7 Jan 2009 14:40:02 +0100
From: "Corentin Chary" <corentin.chary@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
In-Reply-To: <1231330555.6608.79.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200901071022.46343.corentincj@iksaif.net>
	<1231330555.6608.79.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 7, 2009 at 1:15 PM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2009-01-07 at 10:22 +0100, Corentin Chary wrote:
>> Hi,x
>> These are three patch to make a usespace program able to use map/unmap
>> operation and to query if a LEB is mapped.
>> We are trying to do an UBI based userspace filesystem (using fuse) and we
>> needed these, but it could also be used for testing purpose.
>> CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is needed to enable theses functions.
>>
>> The patch can also be download here:
>> http://xf.iksaif.net/dev/uffs/linux/ubi/
>
> Pushed to the master branch of ubi-2.6.git. I tweaked your patches and
> re-named ioctls - please check.
>
> Thanks.


Checked, seems ok to me.
Thanks

-- 
Corentin Chary
http://xf.iksaif.net
