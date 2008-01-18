Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFtvV-0000nM-Ot
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 16:18:48 +0000
Message-ID: <4790D11E.6060201@parrot.com>
Date: Fri, 18 Jan 2008 17:17:34 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
References: <478F7E6D.8010300@parrot.com>	<20080117162601.GA6677@lazybastard.org>	<20080117114353.0bc71dac@zod.rchland.ibm.com>	<479073D1.5010406@parrot.com>
	<20080118064852.026b0c82@zod.rchland.ibm.com>
In-Reply-To: <20080118064852.026b0c82@zod.rchland.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Fri, 18 Jan 2008 10:39:29 +0100
> Matthieu CASTET <matthieu.castet@parrot.com> wrote:
> 
> 
>> In my case the mount is ok : less than 5-10s.
>> The platform used is an arm926 @247 Mhz
> 
> Ok, so running at 247MHz your board has to calculate the CRCs on 41324
> nodes before the file can be opened.  I have no idea how long that
> should really take, but you're doing about 57 nodes per second if it's
> taking 12 minutes.
> 
> As Jörn and David suggested, do some profiling to see where it is
> spending most of it's time.
> 
I sent a mail, but  because of Message has a suspicious header, the 
message wait  moderator approval.


In summary,
the code spend lot's of time in the rbtree code (7 minutes) and 4 
minutes in jffs2_get_inode_nodes.


Matthieu


  54366 rb_prev                                  543,6600
  28345 rb_next                                  283,4500
   8602 default_idle                              71,6833
  10251 __raw_readsl                              40,0430
  49648 jffs2_get_inode_nodes                     11,8097
    251 s3c2412_nand_devready                      7,8438
   1222 crc32_le                                   4,8492
