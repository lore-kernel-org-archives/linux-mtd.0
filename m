Received: from e34.co.us.ibm.com ([32.97.110.132])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0MUR-0006go-3h
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 11:48:40 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Kodandaram, Harish" <Harish.Kodandaram@fci.com>
In-Reply-To: <903E17B6FF22A24C96B4E28C2C0214D7025D7F84@sr-bng-exc01.ap.mot.com>
References: <903E17B6FF22A24C96B4E28C2C0214D7025D7F84@sr-bng-exc01.ap.mot.com>
Content-Type: text/plain
Message-Id: <1093535310.25339.4.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 26 Aug 2004 10:48:31 -0500
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: failing to edit files in mtdblock0 after mounting a jffs image
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-26 at 10:08, Kodandaram, Harish wrote:
> > Jun  1 04:42:09 10 kernel:  printing eip:
> > Jun  1 04:42:09 10 kernel: c024cb00
> > Jun  1 04:42:09 10 kernel: Oops: 0002
> > Jun  1 04:42:09 10 kernel:  
> > Jun  1 04:42:09 10 kernel: CPU:    0
> > Jun  1 04:42:09 10 kernel: EIP:    0060:[ip_send_check+32/80]    Not
> > tainted
> > Jun  1 04:42:09 10 kernel: EFLAGS: 00010216
> > Jun  1 04:42:09 10 kernel: eax: f9744080   ebx: 00001000   ecx: 00000400
> > edx: f71aa000
> > Jun  1 04:42:09 10 kernel: esi: f9744080   edi: 00000000   ebp: f71abd74
> > esp: f71abd58
> > Jun  1 04:42:09 10 kernel: ds: 0068   es: 0068   ss: 0068
> > Jun  1 04:42:09 10 kernel: Process vim (pid: 555, stackpage=f71ab000)
> > Jun  1 04:42:09 10 kernel: Stack: f9744080 c02f6a4c 00000082 f71aa000
> > f71aa000 00000080 00000000 f71abda4 
> > Jun  1 04:42:09 10 kernel:        c024b17a c03458a0 00000000 00000080
> > 00001000 00000000 f7ba59ec 00000080 
> > Jun  1 04:42:09 10 kernel:        00001000 00001000 00000000 f71abde0
> > c0248cbc c03458a0 f7ba5a28 00000080 
> > Jun  1 04:42:09 10 kernel: Call Trace: [ip_options_rcv_srr+442/448]
> > [ip_rcv_finish+12/592]  [netlink_recvmsg+82/368]  [do_con_write+1635/1776]
> > [rs_interrupt+117/352]  [rs_interrupt_single+121/304]  [rmqueue+171/592]
> > [block_til_ready+454/736]  [block_til_ready+670/736]
> > [set_page_dirty+78/112]  [invalidate_list_pages2+160/176]
> > [generic_buffer_fdatasync+184/256]  [invalidate_list_pages2+160/176]
> > [get_device_list+37/128]  [spurious_interrupt_bug+7/24] 
> > Jun  1 04:42:09 10 kernel: Code: f3 a5 f6 c3 02 74 02 66 a5 f6 c3 01 74 01
> > a4 8b 45 f0 ff 48 
> > Jun  1 04:42:09 10 kernel:  <6>note: vim[555] exited with preempt_count 2
> ****************************************************************************
> ******** 

Um...  maybe I am wrong, but doesn't your oops show you got a spurious
interrupt?  If so, how is that related to MTD?

josh
