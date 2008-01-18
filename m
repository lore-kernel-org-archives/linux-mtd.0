Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFniC-00079w-6h
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 09:40:39 +0000
Message-ID: <479073D1.5010406@parrot.com>
Date: Fri, 18 Jan 2008 10:39:29 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
References: <478F7E6D.8010300@parrot.com>	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
In-Reply-To: <20080117114353.0bc71dac@zod.rchland.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Thu, 17 Jan 2008 17:26:01 +0100
> Jörn Engel <joern@logfs.org> wrote:
> 
>>> If we do a ls without waiting that jffs2_garbage_collect_pass finish, ls 
>>> takes 12 minutes to complete.
>> Impressive!  JFFS2 may be slow, but it shouldn't be _that_ slow.  Not
> 
> How do you know?  A 200MiB file will likely have around 50,000 nodes.
Yes the file got 41324 nodes.
> If the summary stuff is incorrect, and since we have no idea what kind
> of platform is being used here, it may well be within reason.
> 
The summary stuff is correct (I check it with a parser on a dump of the 
image). Also if the summary wasn't correct, only the mount time will grow ?
In my case the mount is ok : less than 5-10s.
The platform used is an arm926 @247 Mhz

Matthieu
