Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EcNt7-0007px-7B
	for linux-mtd@lists.infradead.org; Wed, 16 Nov 2005 14:03:51 +0000
Message-ID: <437B3BE4.1000902@yandex.ru>
Date: Wed, 16 Nov 2005 17:02:12 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
References: <200511161024.00999.manningc2@actrix.gen.nz>
In-Reply-To: <200511161024.00999.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Some JFFS3 feedback
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Charles,

Charles Manning wrote:
> I briefly read the JFFS3 doc, and will read it more. It has some very 
> interesting ideas in it.
thanks for your feedback.

> About 9 years back, I did some flash file system patent research and IIRC one 
> of the patents covered something very similar to the Wandering Tree approach 
> to addressing the write-in-place problem, so there might be some IP issues 
> with this. I shall have a scratch around to see if I can find it (though 
> finding something in a 20+ year old paper mountain is a challenge).
Hmm, it is interesting. We would be very appreciated if you provide some 
information.

> I will be interested to see how you tackle the dreaded garbage collection. 
> IMHO, GC is something that needs to be considered sooner rather than later 
> because it is key to sustained write performance.
Absolutely. Me and my workmate in OktetLabs are thinking on this. At the 
moment we're considering 2 approaches. It seems there are no fundamental 
problems, but it needs more thinking, analisys and evaluation. We're 
even going to  create a user-level prototype to see how well (and fast) 
will GC work. Only after I have a clear picture in my mind I'm able to 
put it clearly in the paper.

But we anyway are not going to start implementation befor we've designed GC.

> I know that it is hard to change a name, but JFFS3 is really not much like 
> JFFS2 or JFFS in design, so keeping a similar name really gets confusing 
> later on (I get enough problems with yaffs and yaffs2 and they share 90% of 
> the code). I would suggest a name change to avoid confusion down the track.
Hmm, frankly, I think we may consider JFFS3 as an JFFS2's descendant. 
Yes, the code is probably going to be completely different. But try to 
glance to JFFS3 like this: it is just JFFS2 + on-flash indexing. JFFS2 
keeps indexing in RAM, we are going to keep it on Flash. Glance at 
figure 5 here: 
http://www.linux-mtd.infradead.org/tech/JFFS3design/node8.html.

But if there are some other good names and people are really bothered by 
the JFFS3 name - we might rename it as well.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
