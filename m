Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nNoN-0007T1-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 19:26:31 +0100
Message-ID: <3D78F4A1.4060304@redswitch.com>
Date: Fri, 06 Sep 2002 11:32:01 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
CC: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>, Mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: writing to jffs2 is so slow?
References: <3D77C812.3080108@redswitch.com> <1031314138.28700.167.camel@spawn> <3D78E270.6020203@redswitch.com> <20020906174829.GA3885@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

>>>Maybe it's possible to do a format command that creates a disk that is
>>>empty and prevents the jffs2 code to reformat every block.
>>
>>A format command? What command formats MTD devices (my flash is NOR)? 
>>Thanks.
> 
> Try eraseall from the utils.
> With that, jffs2 just writes the erase markers to flash, 12 bytes per
> erase block.

Well, that's just what I did. Then making a first directory takes 2 minutes.

- Shawn.
