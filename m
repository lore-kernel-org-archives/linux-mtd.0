Received: from 80-25-137-228.uc.nombres.ttd.es ([80.25.137.228] helo=cexter.suinsa)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1854E3-0004x7-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2002 14:10:08 +0100
Received: from tau ([192.6.1.107])
	by cexter.suinsa (8.9.3/8.8.7) with ESMTP id PAA23187
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2002 15:10:58 +0200
Subject: BIOS signature recovery??
From: juanba <juanba@suinsa.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 25 Oct 2002 15:38:55 +0200
Message-Id: <1035553169.29016.18.camel@tau>
Mime-Version: 1.0
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

Playing with a Milenium DOC/ mts Linux tools i have lost the magic
number 0x55aa. 

Howto recovery the stuff ?

I am using directly the interface WriteDOC but it doesn't work.
Is there any quick DOC register map/scheme reference guide?
Are their some kinda ronly register?

The device is really good, in fact is already ext2 formatted and it can
be mounted for r/w operations. I have hack the docprobe stuff adding
some interface/control for the detection and so on but i wanna have also
an extra module parameter to recover the BIOS word. 
 

#ifdef CONFIG_MTD_DOCPROBE_55AA
  /* Check for 0x55 0xAA signature at beginning of window,
     this is no longer true once we remove the IPL (for Millennium */
  o_1 = ReadDOC( window, Sig1 );
  o_2 = ReadDOC( window, Sig2 );
  b_sig_lost = ( o_1 != 0x55 || o_2 != 0xaa );
  if( b_sig_lost ){
    if( !doc_config_location )
      return 0;
     printk( KERN_WARNING "docprobe: signature lost? $%02x/$%02x\n", 
	     o_1, o_2 );
     printk( KERN_WARNING "docprobe: OK. We trust you ;-)\n");
  }
#endif /* CONFIG_MTD_DOCPROBE_55AA */

#ifndef DOC_PASSIVE_PROBE	
  /* It's not possible to cleanly detect the DiskOnChip - the
   * bootup procedure will put the device into reset mode, and
   * it's not possible to talk to it without actually writing
   * to the DOCControl register. So we store the current contents
   * of the DOCControl register's location, in case we later decide
   * that it's not a DiskOnChip, and want to put it back how we
   * found it. 
   */
  tmp2 = ReadDOC(window, DOCControl);
	
  /* Reset the DiskOnChip ASIC */
  WriteDOC(DOC_MODE_CLR_ERR | DOC_MODE_MDWREN | DOC_MODE_RESET, 
	   window, DOCControl);
  WriteDOC(DOC_MODE_CLR_ERR | DOC_MODE_MDWREN | DOC_MODE_RESET, 
	   window, DOCControl);
	
  /* Enable the DiskOnChip ASIC */
  WriteDOC(DOC_MODE_CLR_ERR | DOC_MODE_MDWREN | DOC_MODE_NORMAL, 
	   window, DOCControl);
  WriteDOC(DOC_MODE_CLR_ERR | DOC_MODE_MDWREN | DOC_MODE_NORMAL, 
	   window, DOCControl);
#endif /* !DOC_PASSIVE_PROBE */	

  if( b_sig_lost && doc_recovery ){
     WriteDOC( 0x55, window, Sig1 );
     WriteDOC( 0xaa, window, Sig2 );
     o_1 = ReadDOC( window, Sig1 );
     o_2 = ReadDOC( window, Sig2 );
     b_sig_lost = ( o_1 != 0x55 || o_2 != 0xaa );
     if( b_sig_lost )
       printk(KERN_WARNING "docprobe: signature recovery: FAILs\n");
     printk( KERN_WARNING "docprobe: [ $%02x/$%02x ][ $%02x/$%02x ]\n", 
	     0x55, 0xaa, o_1, o_2 );
  }
