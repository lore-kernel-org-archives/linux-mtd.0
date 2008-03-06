Received: from gv-out-0910.google.com ([216.239.58.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXFBG-0002P7-6C
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 12:26:38 +0000
Received: by gv-out-0910.google.com with SMTP id e6so1647409gvc.5
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Mar 2008 04:26:36 -0800 (PST)
Message-ID: <bae050c10803060426l2b90f9e2n4a0cd3e0dd1c4d19@mail.gmail.com>
Date: Thu, 6 Mar 2008 20:26:34 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBI: question about ubi_leb_change
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    As I know, ubi_leb_change only accept a whole LEB data as one of
its parameter.
    If file system modify a little data which in a old mapped LEB, it
needs to read the whole old mapped LEB data in its buffer first, then
do the little modification, finally deliver to ubi_leb_change?  Is
that right?
    when remove files, there's only inodes .....some file system meta
data changed,
but the real file data still exist which means the LEB still mapped.
Then when you write new data to this very LEB( but contains only
trash), maybe this time, your new data is a whole LEB size.  Still
goes the process:  read the mapped LEB old data to buffer,  replace
the old data with the new one in buffer, deliver to ubi_leb_change?
Really like that?  If the answer is yes, in this situation, waste a
whole block reading time. Maybe UBIFS does not do this.
     But FTL on UBI will face this problem.  And there's no suitable
UBI API for that needs.
     It need :  old_pnum = ubi_leb_unmap( ); but do not erase the mapped PEB
                  new_pnum = ubi_leb_map( );
                  ubi_read_peb( old_pnum,.....)  just like
ubi_read_leb  function
                  ubi_srub_peb( old_pnum ,....)

the write_cache in FTL layer only store changed data, when flush it to
Nand flash
it call " flush_write_cache" function
void flush_write_cache(.......){
         fill_write_cache(......);
        ubi_leb_change(......);
        .....
}
fill_write_cache() will call ubi_read_peb() to fill write_cache with
needed pages which come from the PEB(old_pnum)

      Or there still have another way to solve this, please give me a hint!

      Many thanks!


--
Best wishes,
Nancy
