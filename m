Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPYeL-0000Dc-Ey
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 12:27:18 +0000
Date: Wed, 2 May 2012 14:27:11 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: question about fs/jffs2/readinode.c
In-Reply-To: <1335960469.10293.49.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.02.1205021426530.1880@hadrien>
References: <alpine.DEB.2.02.1204280701210.1917@hadrien>
 <1335960469.10293.49.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Julia Lawall <julia.lawall@lip6.fr>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 May 2012, Artem Bityutskiy wrote:

> On Sat, 2012-04-28 at 07:06 +0200, Julia Lawall wrote:
>> The function read_direntry in fs/jffs2/readinode.c contains the following
>> code:
>>
>>          err = jffs2_flash_read(c, (ref_offset(ref)) + read,
>>                                 rd->nsize - already, &read, &fd->name[already]);
>>  	if (unlikely(read != rd->nsize - already) && likely(!err))
>>                        return -EIO;
>>
>>          if (unlikely(err)) {
>>                  JFFS2_ERROR("read remainder of name: error %d\n", err);
>>                  jffs2_free_full_dirent(fd);
>>                  return -EIO;
>>          }
>>
>> Is it intentional that the first if doesn't free fd?  At first I thought
>> that that might be the case, because what would be the point of having two
>> conditionals if they are going to do the same thing.  But I can't see why
>> fd should not be freed either, so maybe the two conditionals are just
>> there to give different error messages?
>
> Hi Julia,
>
> I think this is a bug and thes conditionals can be joined into one.

Thanks!  I will send a patch soon.

julia
