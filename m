Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CERHe-000575-Ay
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 07:45:40 -0400
Message-ID: <4161379C.3070109@oktetlabs.ru>
Date: Mon, 04 Oct 2004 15:44:28 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096885344.30942.559.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Mon, 2004-10-04 at 14:14 +0400, Artem Bityuckiy wrote:
> 
>>Wha do JFFS2 folks think about the idea?
> 
> 
> It seems to make a lot of sense. We could write such checkpoints only on
> files which are large enough to warrant them, and we could tune the
> frequency of such checkpoints. 
> 
> Of course as with many cute ideas it may turn out to be utterly
> impractical when we implement it :) It does look sane though.
> 
It should also be noted, that the checkpoints support will be added 
under the "#ifdef CONFIG_JFFS2_FS_NAND" directive since it only makes 
sence for the NAND flash devices...


-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
