Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mc3F-0001ia-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:26:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020904101706.D23398@brecis.com> 
References: <20020904101706.D23398@brecis.com>  <NCBBIINEHIPFGJPLBEIFAEKJDLAA.acurtis@onz.com> <Pine.LNX.4.33.0209041551460.22265-100000@hex.linuxgrrls.org> 
To: Steve Wahl <swahl@brecis.com>
Cc: Jasmine Strong <jasmine@hex.linuxgrrls.org>,
    Allen Curtis <acurtis@onz.com>,
    "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 16:26:30 +0100
Message-ID: <7226.1031153190@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

swahl@brecis.com said:
>  But the assumption that using the lsb of the pointer will only break
> on archetectures that don't care about alignment may be a bad one.

Theoretically yes, but in practice no. It is of course possible that some 
architectures will store in a 'pointer' something other than the actual 
address to be put on the bus when accessing the data in question.

Linux doesn't run on any of that hardware, thankfully. And if it becomes a 
problem, the pointer magic can be fixed then, and it'll be a drop in the 
ocean of all the other now-broken assumptions that we have to fix :)

> I haven't looked at the code (shame on me...), but I thought I heard
> the word "tree" mentioned. :-) If this data structure is being used
> for speed, I have to ask if the extra masking instructions are a good
> trade off for the memory saved? 

If you stick it in the rb_parent field, you don't have to mask it out 
during lookup or insertion operations, only during rebalancing. Either way, 
it's a lot faster than the linked list which I just replaced :)

--
dwmw2
