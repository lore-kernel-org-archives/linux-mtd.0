Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKb9L-0006cZ-V4
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 16:20:56 +0000
Received: by wf-out-1314.google.com with SMTP id 28so10147457wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 08:20:55 -0800 (PST)
Message-ID: <8bd0f97a0901070820s79875ac5iba422fc47b897e4@mail.gmail.com>
Date: Wed, 7 Jan 2009 11:20:55 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH 0/2] mtd-utils export libraries
In-Reply-To: <1231344944.6608.87.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0812180615u19344697la740e4ca1a060aff@mail.gmail.com>
	<1229611038.30575.11.camel@sauron>
	<8bd0f97a0812181224w450cb529l9108eaddbf66081c@mail.gmail.com>
	<8bd0f97a0901060716h5c518faau77a7af884f5133c2@mail.gmail.com>
	<52e42efe0901070439s223d8bb3hae377c2c0584c3ec@mail.gmail.com>
	<8bd0f97a0901070808n48bfd6a4vd7693ff085d6bf72@mail.gmail.com>
	<1231344944.6608.87.camel@localhost.localdomain>
Cc: Sidney Amani <amani_s@epitech.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 7, 2009 at 11:15, Artem Bityutskiy wrote:
> On Wed, 2009-01-07 at 11:08 -0500, Mike Frysinger wrote:
>> On Wed, Jan 7, 2009 at 07:39, Sidney Amani wrote:
>> > What we are trying to do is an UBI based userspace filesystem (using fuse).
>> > We use the libubi to get volumes and devices info (ubi_get_dev_info,
>> > ubi_get_vol_info, ubi_get_dev_info1, ubi_get_vol_info1).
>> > Otherwise we communicate with the UBI volume through the cdev driver.
>> > I am not sure a shared library is really desirable, probably not,
>> > anyway it's not fundamental for us...
>> > I particularly though that it could be useful for ubi-tools but I also
>> > realize that it's much more restrictive to have shared libraries.
>>
>> i'm not terribly familiar with the fuse implementation details.  are
>> new filesystems plugins or shared libraries or standalone executables
>> or ... ?  i.e. are you going to be linking the UBI code into another
>> library or into a final application ?
>
> I believe they should first actually _develop_ their file-system. I
> believe they will change/improve the libubi a lot during the
> development. And then we may think about a shared library.

i was inquiring after building a PIC version of libubi for
applications/libraries to link against.  that way people can use it
but still leaves the API open for changes since there is no ABI.
-mike
