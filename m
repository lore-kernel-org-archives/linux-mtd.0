Received: from [203.199.83.247] (helo=rediffmail.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19dTBs-0001zV-Br
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2003 12:14:20 +0100
Date: 18 Jul 2003 11:12:56 -0000
Message-ID: <20030718111256.30205.qmail@mailweb34.rediffmail.com>
MIME-Version: 1.0
From: "MTD MTD MTD" <ragh_avan_mtd@rediffmail.com>
To: linux-mtd@lists.infradead.org
Content-Disposition: inline
Content-type: text/plain;
	format=flowed
Subject: flash endian
Reply-To: MTD MTD MTD <ragh_avan_mtd@rediffmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi;

I have the following questions with regard to flash endianness. I 
am awaiting a big endian processor based board; so I want to make 
sure that I have the processor-flash interface with respect to 
endianness correct before I start on the actual work.

(i) Does a flash chip by itself have any endianness? If so what is 
the endian mode of Intel/flash chips?

(ii) Also does CFI have anything to say about flash endian?

(iii) Is there any documentation on the endian support inside MTD 
code?(with respect to CFI queries and actual data)

Also any things I need to watch out on the board schematics with 
respect to endianness?

Thanks in advance
Raghav
___________________________________________________
Download the hottest & happening ringtones here!
OR SMS: Top tone to 7333
Click here now: 
http://sms.rediff.com/cgi-bin/ringtone/ringhome.pl
