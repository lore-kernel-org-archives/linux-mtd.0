Received: from mail-we0-f171.google.com ([74.125.82.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX8Rs-00005x-39
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 11:42:32 +0000
Received: by mail-we0-f171.google.com with SMTP id t60so3521019wes.16
 for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2013 04:42:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALuNSF7ESa0CBE0+kNO_HDeWKVgzN8ZZo7TnNGadTC0AuZjEXQ@mail.gmail.com>
References: <CALuNSF7ESa0CBE0+kNO_HDeWKVgzN8ZZo7TnNGadTC0AuZjEXQ@mail.gmail.com>
From: Simon Liddicott <simon@liddicott.com>
Date: Fri, 18 Oct 2013 12:41:50 +0100
Message-ID: <CALuNSF7A=PBpyP4=nEEKvuhAMAQJvucGddhHPuxSuqZuCTnmEg@mail.gmail.com>
Subject: Re: nandsim LEB size mismatch
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 October 2013 14:57, Simon Liddicott <simon@liddicott.com> wrote:
> Hi
>
> I've searched the archives and read the FAQ but not found anything
> that matches my situation.
>
> I am trying to read an image I think is made for an MT29F2G08ABAEA.
>
> I have run the following:
>
> $ sudo modprobe nandsim first_id_byte=0x2c second_id_byte=0xda \
> third_id_byte=0x90 fourth_id_byte=0x95
> $ sudo flash_erase /dev/mtd0 0 0
> $ sudo modprobe ubi mtd=0
> $ sudo ubimkvol /dev/ubi0 -N RFS -s $((0xA00000))
>
> Volume ID 0, size 82 LEBs (10579968 bytes, 10.1 MiB), LEB size 129024
> bytes (126.0 KiB), dynamic, name "RFS", alignment 1
>
> $ sudo ubiupdatevol /dev/ubi0_0 RFS.bin
> $ sudo mount /dev/ubi0_0 /mnt
>
> mount: wrong fs type, bad option, bad superblock on /dev/ubi0_0,
>        missing codepage or helper program, or other error
>        In some cases useful info is found in syslog - try
>        dmesg | tail  or so
>
> [1975256.515179] UBIFS error (pid 10309): validate_sb: LEB size
> mismatch: 126976 in superblock, 129024 real
>
> I think that nandsim provides the 'real' value for LEB size, and even
> if the value is right - how can I read the data that expects a 124KiB
> LEB size?
>
> Any help appreciated.
>
> Thanks in advance.
>
> Simon.


I didn't get a reply, but have managed to find out how to do it.

The correct instructions should be:
$ sudo modprobe nandsim first_id_byte=0x2c second_id_byte=0xda \
third_id_byte=0x90 fourth_id_byte=0x95
$ sudo flash_erase /dev/mtd0 0 0
$ sudo ubiformat /dev/mtd0 -s 2048 -O 2048
$ sudo modprobe ubi
$ sudo ubiattach -m 0 -d 0 -O 2048
$ sudo ubimkvol /dev/ubi0 -N RFS -s $((0xA00000))
$ sudo ubiupdatevol /dev/ubi0_0 RFS.bin
$ sudo mount /dev/ubi0_0 /mnt

Success!
