Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSdT3-0002JW-Kf
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 10:36:06 -0500
Message-ID: <4194D845.7070607@oktetlabs.ru>
Date: Fri, 12 Nov 2004 18:35:33 +0300
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4194D188.9050200@oktetlabs.ru>
	<1100272904.21273.193.camel@baythorne.infradead.org>
In-Reply-To: <1100272904.21273.193.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Garbage collect pristine nodes
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Fri, 2004-11-12 at 18:06 +0300, Artem Bityuckiy wrote:
> 
>>We allocate sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN which is 
>>   only 68 + 128 bytes. But the maximum size of direntry is more than 
>>245 bytes. So, if few bytes were allocated (alloclen < rawlen) and this 
>>is just direntry with long name, we Garbage Collect it using long path 
>>(which is unneeded).
> 
> 
> How often does this _actually_ happen? Remember, alloclen tells us how
> much space is _available_ -- it could be larger than the amount we asked
> for. So we'll only take the long route if the name in the dirent is
> large _and_ it wouldn't actually fit in the end of the eraseblock.
> 
Hmm, you are right.

Forget about this :-)

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
