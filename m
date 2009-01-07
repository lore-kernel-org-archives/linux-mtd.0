Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKUtw-0001Ch-1A
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 09:40:37 +0000
Received: by bwz5 with SMTP id 5so18295374bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 01:40:34 -0800 (PST)
Message-ID: <71cd59b00901070140o1f75a31asc970fd2c853b225@mail.gmail.com>
Date: Wed, 7 Jan 2009 10:40:32 +0100
From: "Corentin Chary" <corentin.chary@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
In-Reply-To: <1231320756.6608.63.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200901071022.46343.corentincj@iksaif.net>
	<1231320756.6608.63.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 7, 2009 at 10:32 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
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
> The requested URL /dev/uffs/linux/ubi/ was not found on this server.

Was uploading, works now

-- 
Corentin Chary
http://xf.iksaif.net
