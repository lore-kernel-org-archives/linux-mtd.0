Received: from bay2-f142.bay2.hotmail.com ([65.54.247.142] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19XUpI-00011f-Bs
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2003 00:46:20 +0100
From: "George Jiang" <thinkpad_linux@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 01 Jul 2003 17:46:07 -0600
Mime-Version: 1.0
Message-ID: <BAY2-F142dZhotjCjWE00001848@hotmail.com>
Content-Type: text/plain; format=flowed
Subject: size of my program too large
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for your time.

--- Steps ---
During my research I have to use a Fortran program for scientific 
computation. It deals with a large model.
first, I use "f77 aa.f -o aa.exe" to compile it;
second, I use "size aa.exe" to view the size of the exe file;
third, I use "./aa.exe" to run the program.

--- Problem ---
When the size is larger than 1.0 G, I got the message "Segmentation fault 
(core dumped)"  when I run "./aa.exe";
Then I adjusted the model size, and redo step1,2,3. This time the program 
runs well.

--- Question ---
My computer has 1.5G memory; does anyone know how to fix this problem so 
that I can run the program with a larger model (my research requires me to 
run a large model)?  such a
s modify the configuration or settings of the Linux system... ( red hat 
linux 8.0
)?
( I've thought about MPI; But it's not easy to modify the program for 
parralel
computing, so I want to find another solution)

Thanks a lot!!
  George Jiang

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail
