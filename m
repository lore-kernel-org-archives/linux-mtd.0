Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7Azd-0003Oe-Su
	for <linux-mtd@lists.infradead.org>; Wed, 08 Oct 2003 10:52:30 +0100
Message-ID: <3F83DCED.8090206@hectrix.com>
Date: Wed, 08 Oct 2003 17:46:21 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
	<3F7CD9CA.5090805@hectrix.com>
	<1065160480.16088.0.camel@imladris.demon.co.uk>
	<3F7D31B7.7020400@hectrix.com>
	<1065171167.22491.53.camel@hades.cambridge.redhat.com>
In-Reply-To: <1065171167.22491.53.camel@hades.cambridge.redhat.com>
Content-Type: multipart/mixed;
 boundary="------------000009000006080006010902"
Subject: Re: high cpu usage using nftl for DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000009000006080006010902
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On 10/03/2003 04:52 PM, David Woodhouse wrote:
> Also, can you reset the profile counts (readprofile -r) and get a
> reading from the time when it's doing this alone, rather than including
> everything from boot onwards.

Here is the output of readprofile after reset and before nftld holds my cpu:

     1 __generic_copy_to_user                     0.0139
     1 write_profile                              0.0208
   380 default_idle                               9.5000
   382 total                                      0.0003

Then I simply entered "ls /mnt/doc" (which is mounted at boot to
/dev/nftla1), and got the following result (I skipped those with one
occasion only):

     2 __delay                                    0.0333
     2 sock_poll                                  0.0500
     2 unix_poll                                  0.0135
     3 __const_udelay                             0.0833
   284 _DoC_WaitReady                             2.8400
   577 __rdtsc_delay                             20.6071
  1199 default_idle                              29.9750
  2084 total                                      0.0018

This is the output a few seconds later (also skipped some lines):

     2 add_wait_queue                             0.0500
     2 __generic_copy_to_user                     0.0278
     2 sock_poll                                  0.0500
     3 __delay                                    0.0500
     3 unix_poll                                  0.0203
     5 __const_udelay                             0.1389
   607 _DoC_WaitReady                             6.0700
  1199 default_idle                              29.9750
  1243 __rdtsc_delay                             44.3929
  3082 total                                      0.0026

So, __rdtsc_delay and _DoC_WaitReady seem to be the source of the
problem. I hope these will help you investigate. I have attached the
three outputs of readprofile for your reference.

> If it does it only sometimes, is there any pattern to when it starts or
> stops?

Once it has started, it would never stop. Sometimes, after fsck on the
doc, and remount, it becomes normal. But this time, I even tried booting
using the doc and perform some operations (like 'find .') and rebooting
back using my harddisk, and also tried booting using dos floppy and used
dinfo without the problem, but when back to Linux the problem was still
there.

I think dformating in dos is my last resort.

Selwyn


--------------000009000006080006010902
Content-Type: text/plain;
 name="before"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="before"

     1 __generic_copy_to_user                     0.0139
     1 write_profile                              0.0208
   380 default_idle                               9.5000
   382 total                                      0.0003



--------------000009000006080006010902
Content-Type: text/plain;
 name="after"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="after"

     1 add_wait_queue                             0.0250
     1 do_softirq                                 0.0061
     1 do_wp_page                                 0.0020
     1 __find_get_page                            0.0227
     1 __generic_copy_to_user                     0.0139
     1 get_pid                                    0.0029
     1 handle_IRQ_event                           0.0109
     1 journal_add_journal_head                   0.0050
     1 strncpy_from_user                          0.0132
     1 supplemental_group_member                  0.0179
     1 __switch_to                                0.0054
     1 sys_gettimeofday                           0.0032
     1 system_call                                0.0179
     1 tty_poll                                   0.0071
     1 write_profile                              0.0208
     2 __delay                                    0.0333
     2 sock_poll                                  0.0500
     2 unix_poll                                  0.0135
     3 __const_udelay                             0.0833
   284 _DoC_WaitReady                             2.8400
   577 __rdtsc_delay                             20.6071
  1199 default_idle                              29.9750
  2084 total                                      0.0018



--------------000009000006080006010902
Content-Type: text/plain;
 name="after2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="after2"

     1 do_anonymous_page                          0.0047
     1 do_softirq                                 0.0061
     1 do_wp_page                                 0.0020
     1 __find_get_page                            0.0227
     1 __generic_copy_from_user                   0.0114
     1 get_pid                                    0.0029
     1 handle_IRQ_event                           0.0109
     1 journal_add_journal_head                   0.0050
     1 __loop_delay                               0.0250
     1 strncpy_from_user                          0.0132
     1 supplemental_group_member                  0.0179
     1 __switch_to                                0.0054
     1 sys_gettimeofday                           0.0032
     1 system_call                                0.0179
     1 tty_poll                                   0.0071
     1 write_profile                              0.0208
     2 add_wait_queue                             0.0500
     2 __generic_copy_to_user                     0.0278
     2 sock_poll                                  0.0500
     3 __delay                                    0.0500
     3 unix_poll                                  0.0203
     5 __const_udelay                             0.1389
   607 _DoC_WaitReady                             6.0700
  1199 default_idle                              29.9750
  1243 __rdtsc_delay                             44.3929
  3082 total                                      0.0026



--------------000009000006080006010902--
