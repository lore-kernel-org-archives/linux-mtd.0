Received: from web11607.mail.yahoo.com ([216.136.172.59])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D7BOD-0000o5-FL
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 06:54:42 -0500
Message-ID: <20050304115440.64103.qmail@web11607.mail.yahoo.com>
Date: Fri, 4 Mar 2005 03:54:40 -0800 (PST)
From: prasadam kumar <prasadamkumar@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: IQ80321 flash writing problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


hai to all

 sorry to trouble you again because i am sending this
problem second time. plz read this problem and give
me the resons why it is altering some memory
locations, so i can look into those issues.

We are working on a task which has to write to a
IQ80321 flash  which is configured as a
MTD CHAR device which uses CFI cmdset 0001 in the
kernel version 2.4.19-rmk7-ds2.

The problem we've encountered is while writing to the
flash, data is getting corrupted in
some memory locations which are at random.

        Here's the flow symbols which are invoked at
the time of write....

                     cfi_intelext_write_buffers ( )
                                      |
                                      |
                                      V
                           do_write_buffers(... )
                                       |
                                       |
                                       V
                              map->write8( )
                                        |
                                        |
                                        V
                               iq80321_write8 ( )
We are cross checking the data that is been sent
before invoking map->write8(). Over here the
checking was successful (i.e there is no corruption in
the data ). But after map->write8() is
invoked, data at some memory locations is getting
altered.




	
		
__________________________________ 
Celebrate Yahoo!'s 10th Birthday! 
Yahoo! Netrospective: 100 Moments of the Web 
http://birthday.yahoo.com/netrospective/
