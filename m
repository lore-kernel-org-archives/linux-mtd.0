Received: from mail-bw0-f209.google.com ([209.85.218.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NgjlD-0007Jz-8W
	for linux-mtd@lists.infradead.org; Sun, 14 Feb 2010 19:04:07 +0000
Received: by bwz1 with SMTP id 1so3349935bwz.32
	for <linux-mtd@lists.infradead.org>;
	Sun, 14 Feb 2010 11:04:00 -0800 (PST)
Subject: Re: Legacy memstick support + FTL questions
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <559624.1287.qm@web37604.mail.mud.yahoo.com>
References: <559624.1287.qm@web37604.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 14 Feb 2010 21:03:55 +0200
Message-ID: <1266174235.3451.107.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-02-14 at 07:06 -0800, Alex Dubov wrote: 
> > 
> > 
> > I would like to know more about the registers.
> > 
> > 
> > struct ms_status_register {
> >     unsigned char reserved;
> >     unsigned char interrupt;
> 
> * command can not be executed
> > #define MEMSTICK_INT_CMDNAK 0x01
> 
> * MS IO stuff. Probably superseded by Pro IO protocol.
> > #define MEMSTICK_INT_IOREQ  0x08
> > #define MEMSTICK_INT_IOBREQ 0x10
> 
> * card is ready for data transfer (actual read/write block data)
> > #define MEMSTICK_INT_BREQ   0x20
> 
> * some error occured
> > #define MEMSTICK_INT_ERR    0x40
> 
> * command completed (either successfully or erroneously)
> > #define MEMSTICK_INT_CED    0x80
> > 
> >     unsigned char status0;
> 
> * media is write protected
> > #define MEMSTICK_STATUS0_WP  0x01
> 
> * media is sleeping (not very useful, as far as I can see)
> > #define MEMSTICK_STATUS0_SL  0x02
> 
> * media buffer full (used when reading)
> > #define MEMSTICK_STATUS0_BF  0x10
> 
> * media buffer empty (used when writing)
> > #define MEMSTICK_STATUS0_BE  0x20
> 
> * flash busy
> > #define MEMSTICK_STATUS0_FB0 0x40
> 
> * media busy (applies to built-in controller)
> > #define MEMSTICK_STATUS0_MB  0x80
> > 
> >     unsigned char status1;
> 
> 
> * uncorrectable flag error
> > #define MEMSTICK_STATUS1_UCFG 0x01
> 
> * flag error (applies to "overwrite flag" field in extra data)
> > #define MEMSTICK_STATUS1_FGER 0x02
> 
> * uncorrectable extra data error
> > #define MEMSTICK_STATUS1_UCEX 0x04
> 
> * extra data (oob) error
> > #define MEMSTICK_STATUS1_EXER 0x08
> 
> * uncorrectable data error (single bit errors are correctable)
> > #define MEMSTICK_STATUS1_UCDT 0x10
> 
> * data error
> > #define MEMSTICK_STATUS1_DTER 0x20
> 
> * flash busy (if media is busy, FB1 is not set, but FB0 is, the stick is
> in invalid state)
> > #define MEMSTICK_STATUS1_FB1  0x40
> 
> * media busy (same meaning as in status0)
> > #define MEMSTICK_STATUS1_MB   0x80
> > } __attribute__((packed));
> > 
> > Could you explain meaning of these flags?
> > I understand some but not all.
> 
> > 
> > Hardware register #16 (on my reader) seems to hold some
> > status flags as well,
> > It is interesting that there are many status flags, and
> > they don't seem
> > to fit nether jmicron nor TI flag register
> > This register is polled to wait after an TPC, but several
> > different bits are polled
> > I thought that there is a relation between it and memstick
> > status register.
> 
> It is quite possible. Some controllers will automatically retrieve an
> "interrupt" field from the status register on each media access (in fact,
> this behavior is mandated in parallel mode). Check if the bits fit "inter-
> rupt" register bits.
Doesn't seem to map to anything.




0x10 is polled on register writes
0x20 is polled on command writes, and then 0x10 is polled
0x50 (0x40 | 0x10) if polled after MS_TPC_GET_INT and only it

0x03 is mask for error detection, if found in any of above polls, error
out.

The above was for register #19 (0xXX000000) 

after the MS_TPC_READ_LONG_DATA, 0x40 is polled, and register #18 is
polled for 0x20 clear. These are all bits that are accessed.

You try to tell me that controller itself issues TPCs, reads their
responses, and puts that in registers, right? This is very interesting.

Bus is half duplex, and there is a line that indicates who sends data.

I currently understand that host sends an TPC, then card sends a
response. Is it another TPC?




> 
> > 
> > struct ms_id_register {
> >     unsigned char type;
> >     unsigned char if_mode;
> >     unsigned char category;
> >     unsigned char class;
> > } __attribute__((packed));
> > 
> > This register set is used to determine all kinds of
> > things,
> > could you explain its meaning?
> 
> This is an informal media id register. The mess you can see with its field
> values is caused purely by Sony's inability to make its mind.
> You can use it to differentiate between legacy, Pro and IO devices, but
> that's roughly it.
> 
> > 
> > 
> > struct ms_param_register {
> >     unsigned char system;
> 
> * 0 - serial, 1 - parallel mode
> > #define MEMSTICK_SYS_PAM  0x08
> 
> * always 1 on legacy sticks
> > #define MEMSTICK_SYS_BAMD 0x80
> 
> > These correspond to parallel and serial modes, right?
> > There seems to be a large dance around switching these
> > modes.
> > You seem to mention 8 bit serial mode. How that could be
> > possible?
> > 
> 
> MS Pro HG sticks have 8bit capability as well as extended address space.
> Each of the data pads on such sticks is split in two.
> 
> * physical block address 
> >     unsigned char block_address[3];
> 
> * block access mode modifier
> >     unsigned char cp;
> 
> * read/write data + extra data and autoincrement page address pointer
> > #define MEMSTICK_CP_BLOCK     0x00
> 
> * read/write data + extra data and stay at the same page
> > #define MEMSTICK_CP_PAGE      0x20
> 
> * read/write extra data only and stay at the same page
> > #define MEMSTICK_CP_EXTRA     0x40
> 
> * read/write flag area and stay at the same page
> > #define MEMSTICK_CP_OVERWRITE 0x80
> > I have rough idea what that means, but an explanation won't
> > hurt.
> > Especially MEMSTICK_CP_OVERWRITE
> 
> The idea is that "overwrite flag" field in the extra data area can be
> accessed separately, has its own error correction logic and otherwise
> behaves as a separate entity (it even has dedicated bits in the status1
> register). This field is used by software to store advisory information
> and to aid recovery from interrupted flash operations.
> 
> * page address within block
> >     unsigned char page_address;
> > } __attribute__((packed));
> > 
> > 
> > struct ms_extra_data_register {
> >     unsigned char  overwrite_flag;
> 
> * 1 - block is stable, 0 - block is being updated
> This bit can be reset on blocks which are scheduled for relocation/update.
> If operation in question is abruptly terminated, information in this bit
> should assist in subsequent restoration of media's logical integrity.
> > #define MEMSTICK_OVERWRITE_UDST  0x10
> 
> * 3 - page is ok, 2/1 - page should not be accessed, 0 - page can be
> accessed, but its data integrity can not be assured
> > #define MEMSTICK_OVERWRITE_PGST1 0x20
> > #define MEMSTICK_OVERWRITE_PGST0 0x40
> 
> * 1 - block is ok, 0 - block should not be accessed
> > #define MEMSTICK_OVERWRITE_BKST  0x80
> > 
> 
> * This register does not seem to be very useful. It is used to specify
> that page in question has special meaning, which mostly applies to DRM
> implementations (superseded by MS Pro) or severely RAM restricted systems.
> >     unsigned char  management_flag;
> 
> * page is used for system purposes (?)
> > #define MEMSTICK_MANAGEMENT_SYSFLG 0x04
> 
> * page is used to store temporary physical to logical mapping table
> > #define MEMSTICK_MANAGEMENT_ATFLG  0x08
> 
> * DRM crap
> > #define MEMSTICK_MANAGEMENT_SCMS1  0x10
> > #define MEMSTICK_MANAGEMENT_SCMS0  0x20
> > 
> 
> * logical address of the block (must obey zoning restrictions)
> Each zone has 512 physical blocks.
> The very first zone is only allowed 494 logical blocks, all other have
> 496 logical blocks. The rest of the physical blocks in each zone are used
> as spares and must be reused within the zone boundaries.
> >     unsigned short logical_address;
> > } __attribute__((packed));
> > 
> > Same here, mangement flag seems to be used often by
> > driver.
> 
> Management flag should not be used at all. The only possible use for it
> (apart from DRM) is to mark volatile pages which can be used to store the
> block look-up table. If there's enough RAM, no such tricks are necessary.
> Default value for the unused flags is 0xff and it better be set.
> 
> On the other hand, overwrite flag should be used quite extensively.
> 
> 
> > 
> > 
> > struct ms_register {
> >     struct ms_status_register 
> >    status;
> >     struct ms_id_register   
> >      id;
> >     unsigned char       
> >          reserved0[8];
> >     struct ms_param_register   
> >   param;
> >     struct ms_extra_data_register
> > extra_data;
> >     unsigned char       
> >          reserved1[2]; /* pad
> > to word boundary */
> > }
> > I guess that first two fields of ms_extra_data_register
> > should belong to 
> > ms_param_register, for alignment.
> 
> No. They are separate hardware registers on the media side, and the
> offsets are like this.
> 
> > Also, I don't get why status register has so many flags.
> > As I understand it, TPCs are send in both directions, and
> > nothing more.
> > There are no dedicated lines, or something like that.
> 
> TPC means "transport protocol command" and it is only send from host to
> media. Generally speaking, the whole thing works like this (each point
> is a TPC):
> 
> 1. Host selects media register access window.
> 2. Host modifies media register values.
> 3. Host invokes media command.
> 4. Host reads media registers.
> 5. Host moves data around.
> 6. Lather, rinse, repeat.

> 
> > 
> > So status should be a content of the answer TPC or
> > something like that.
> 
> It is not.
> 
> > 
> > 
> > I wish I had the memstick spec (original not pro)
> > 
> 
> There's an email address on Sony's website.
And the chances they give me the specs without NDA and a lump of money
are higher that winning a lottery?

It is very sad to see these proprietary devices and protocols.

I actually did pay for all the licence costs, because I did buy the
device, and a driver....


Best regards,
Maxim Levitsky
