Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJrXv-0002DR-Fw
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 06:48:52 -0400
Message-ID: <4174F0F3.7030604@yandex.ru>
Date: Tue, 19 Oct 2004 14:48:19 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>
In-Reply-To: <4174E7D3.9050706@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> Now the compression mode is a global thing. It can be configured by 
> kernelconfig and is the same for every filesystem. There is no reserved 
> space to store it in the different JFFS2 filesystems (it should need a 
> new type of node or something like that).
It isn't needed to store the default compression mode *on flash*. If you 
just move the variable jffs2_compression mode to the jffs2_sb_info 
structure, you will have per-filesystems compression mode. This means, 
for example, that if user changes (dynamically) the compression mode for 
one file-system, the compression mode for another file system isn't changed.

> 
> There is plans for the future. One of them: there will be "compression 
> configurations". This is much more general thing than compression mode. 
> (contais not only the compression mode but the set of the enabled 
> compressors and its priority) The user will be able to define different 
> compressor configuration for files or directories. The description of 
> these configuration will be stored in a new type of node 
> (RWCOMPACT_COPY), and the index of the requested configuration will be 
> stored in the upper 4 bits of 'usercompr' field of jffs2_raw_inode.
Great idea!

But this is the another (deeper) layer. If a file/directory has the 
compression mode set, it would be applied. But the *per-filesystem* 
compression may be used by default (for those files who are not 
mentioned in your "compression configuration" node).



-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
