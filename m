Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Ebbl8-0007RR-Qf
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 05:40:25 -0500
Message-ID: <43786975.9000204@yandex.ru>
Date: Mon, 14 Nov 2005 13:39:49 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "zhao, forrest" <forrest.zhao@intel.com>
References: <1131961875.3417.35.camel@localhost.localdomain>
In-Reply-To: <1131961875.3417.35.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Some thoughts about JFFS3 design doc
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao, forrest wrote:
> Hi, Artem
> 
> I read through your JFFS3 design doc and had some thoughts
I'm flattered you're reading my writings :-)

> 1 in Section 4.1->4, there's a typo:
> direntries contain {xattr name =>xattr ID}......
Oh, thanks.

> 2 in section 3.6, I think it's better if you could
> give a description or an example of how to replay
> the journal to build the journal tree in RAM and
> recover the inconsistent meta data on flash.
Yes, there is supposed a distinct big chapter related to this topic. I 
just have not had time to write it so far.

> 3 In section 4, I think it's better if you could
> give a description or an example of what happens
> for an update operation. Such as what happens when
> a write operation update offset from 100 to 200 for
> a file of length 400 bytes. I guess maybe you are
> working on this now :)
Nothing interesting - the new node just goes to the journal and the old 
one is considered obsolete.

I'm planning to add a distinct chapter with description of 
JFFS3-in0action where this will be described. Thanks for the note.

> 4 I think your design doc is well-organized and give
> reader a very clear picture and illustration of the
> JFFS3 design.
Thanks, the only really major missing thing is Garbage Collection. Will 
describe it as soon as I completely design it.

Feel free to send any comments, and even patches - the design sources 
are in MTD CVS (Documentation/mtd/).

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
