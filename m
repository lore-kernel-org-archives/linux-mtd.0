Received: from mail.ccdaust.com.au ([203.29.88.42]
	helo=gateway.ccdaust.com.au)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B36Tl-00035Q-L8
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2004 04:47:02 +0000
Received: from [192.168.2.80] (helo=wasp.net.au)
	by gateway.ccdaust.com.au with esmtp (Exim 3.35 #1 (Debian))
	id 1B36ha-0004cH-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Mar 2004 13:01:19 +0800
Message-ID: <405686B3.4090607@wasp.net.au>
Date: Tue, 16 Mar 2004 08:46:43 +0400
From: Brad Campbell <brad@wasp.net.au>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <002901c406cb$3c049ec0$fd0ba8c0@briantpc>
	<1079387201.5835.344.camel@imladris.demon.co.uk>
In-Reply-To: <1079387201.5835.344.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: free_list / free_size messages
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Wed, 2004-03-10 at 12:12 -0600, Brian T wrote:
>>Mar 10 12:07:25 klogd: Eep. Block 0x00120000 taken from free_list had
>>free_size of 0x00000038!!
> 
> 
> I've no idea what could cause this; it's a sanity check which I don't
> recall ever happening to anyone else. Can you run with a serial console
> and CONFIG_JFFS2_FS_DEBUG=1, and with 'debug' on the kernel command
> line. Log _everything_ it says, and hopefully it'll give us a clue.
> 

I have seen this a bit on my iPAQ 3800 with a familiar 2.4.19-hh36 kernel. I just guessed it was 
informative and I tend to ignore it. Should I try and reproduce it for debugging?

Regards,
Brad
