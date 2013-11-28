Received: from mo6-p00-ob.rzone.de ([2a01:238:20a:202:5300::1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vlxyy-00074S-5h
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 09:34:01 +0000
Received: from [192.168.0.195]
 (pD9E0EEB4.dip0.t-ipconnect.de [217.224.238.180])
 by smtp.strato.de (RZmta 32.17 DYNA|AUTH)
 with (TLSv1.0:DHE-RSA-AES256-SHA encrypted) ESMTPSA id D011a5pAS9XY8nz
 for <linux-mtd@lists.infradead.org>;
 Thu, 28 Nov 2013 10:33:34 +0100 (CET)
Message-ID: <52970DEE.3070302@elreha.de>
Date: Thu, 28 Nov 2013 10:33:34 +0100
From: "Albrecht, Harald" <harald.albrecht@elreha.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Garbage collection issue
References: <5295C538.6040207@elreha.de>
 <OFD4B20B8F.D587329D-ONC1257C30.0038B520-C1257C30.0039136C@transmode.se>
In-Reply-To: <OFD4B20B8F.D587329D-ONC1257C30.0038B520-C1257C30.0039136C@transmode.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

thank you for the fast reply.
What we figured out is that the jffs2_garbage_collect_pass loops for 
several minutes in the first for(;;) loop. It always went into the if 
statement after jffs2_get_ino_cache. In this situation it's not 
interruptable by any signals.

Regards
   Harald


"linux-mtd" <linux-mtd-bounces@lists.infradead.org> wrote on 2013/11/27 
11:11:04:
>> Hi all,
>>
>> we are currently facing a problem with the Garbage-collection on a JFFS2
>> file system.
>>
>> We have an embedded linux system based on an ARM9 AT91RM9200 processor
>> with an Intel / Micron JS28F256 NOR-flash of 32MB in size.
>> The Flash holds the U-Boot loader and its environment and in the main
>> part (30MB) of the chip a JFFS2-based root-file-system.
>> Our Linux kernel version is 2.6.24.3
>>
>> Some minutes after startup of the system, the garbage collector (gc.c)
>> does a scan of the file system, gathering information for the garbage
>> collection procedures that may be initiated based upon that data.
>> On some file systems, especially such with long runtime and therefore
>> many file operations, this scan consumes a lot of time. On some systems
>> it stays in that scan for more that 10 minutes. The problem with this
>> behaviour is the fact, that during the scan the file system is locked,
>> and therefore all file operations are suspended. This leads to a crash
>> of the system, when the application program hangs for a long time,
>> waiting for a file operation to return from a system call, and the
>> watchdog is not triggered.
>>
>> In a test system without watchdog, after the scan, the system runs
> normally.
>> The flash chip itself shows no errors, so it seems to be a problem of
>> the file system.
>>
>> Any idea or suggestion to solve the problem would be very welcome!
> The simple fix is to send a signal(SIGCONT?) to the GC process regularly
> to do GC
> over time. That way you don't get all GC at boot time.
>
>   Jocke
>   
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
