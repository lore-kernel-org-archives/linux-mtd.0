Received: from mail.truetzschler.de ([213.164.131.155])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKXQu-00042t-Cs
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 03:32:26 -0400
Message-ID: <41776604.4010101@truetzschler.de>
Date: Thu, 21 Oct 2004 09:32:20 +0200
From: christoph glaeser <christoph.glaeser@truetzschler.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 problem on ST M29W640DB (90 ns)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

the problem is the Flash ST-M29W640DB itself:

"The Read/Reset command must be issued to return the device to the 
previous mode (the Read Array mode or Autoselected mode). A second 
Read/Reset command would be needed if the device is to be put in the 
Read Array mode from Autoselected mode."

To solve this problem, change the funktion "cfi_cmdset_0002()" in File 
"cfi_cmdset_0002.c":

  ...
  cfi_send_gen_cmd(0xf0, 0x55, base, map, cfi, cfi->device_type, NULL);
  
/***********************************************************************************************/
  /* Fixed 20.10.2004 (C.Gl.)                  
                                                  */
  
/*                                                                                             
*/
  /* Probleem: Flash ST 
M29W640DB                                                                */
  /* If the Chip is in "Read CFI Query Command"-Mode, the first 
"Read/Reset"-Command will turn   */
  /* the Flash back to previous mode (=Autoselet-Mode); a second 
"Read/Reset"-command would be   */
  /* needed if the device is to be put in the "Read Array"-mode from 
Autoselected mode!          */
  
/*                                                                                             
*/
    cfi_send_gen_cmd(0xf0, 0x55, base, map, cfi, cfi->device_type, NULL);
  
/***********************************************************************************************/
    return cfi_amdstd_setup(map);
}

Good Luck,

Christoph Glaeser
