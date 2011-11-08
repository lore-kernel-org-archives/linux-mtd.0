Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNiSy-0003wx-3u
 for linux-mtd@lists.infradead.org; Tue, 08 Nov 2011 09:59:42 +0000
Received: by bkat2 with SMTP id t2so284848bka.36
 for <linux-mtd@lists.infradead.org>; Tue, 08 Nov 2011 01:59:37 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 8 Nov 2011 10:59:37 +0100
Message-ID: <CAN2PfcaTWNW=G6qFvxgRMtNTyeBwBypay8hakvPGSc5_-nSoug@mail.gmail.com>
Subject: [UBI] Unable to attach UBI volume
From: Marek Skuczynski <mareksk7@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
   After overnight test using fsstress and forced system reboot I have
a problem to attach an UBI volume.
   Probably the root cause of such problem has been already resolved,
so I would appreciate if you can point
   the fixes out.  My Linux kernel version is 2.6.31.14

  Thank you in advance for you help.

Regards,
  Marek

   ~ # /root/ubiattach /dev/ubi_ctrl -m 5 -O 2048
[   71.877000] UBI DBG (pid 1081): ctrl_cdev_ioctl: attach MTD device
[   71.883000] UBI: attaching mtd5 to ubi0
[   71.887000] UBI DBG (pid 1081): io_init: min_io_size      2048
[   71.893000] UBI DBG (pid 1081): io_init: hdrs_min_io_size 2048
[   71.899000] UBI DBG (pid 1081): io_init: ec_hdr_alsize    2048
[   71.905000] UBI DBG (pid 1081): io_init: vid_hdr_alsize   2048
[   71.911000] UBI DBG (pid 1081): io_init: vid_hdr_offset   2048
[   71.917000] UBI DBG (pid 1081): io_init: vid_hdr_aloffset 2048
[   71.923000] UBI DBG (pid 1081): io_init: vid_hdr_shift    0
[   71.929000] UBI DBG (pid 1081): io_init: leb_start        4096
[   71.934000] UBI DBG (pid 1081): io_init: max_erroneous    16
[   71.940000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[   71.947000] UBI: logical eraseblock size:    126976 bytes
[   71.952000] UBI: smallest flash I/O unit:    2048
[   71.957000] UBI: VID header offset:          2048 (aligned 2048)
[   71.963000] UBI: data offset:                4096
[   71.971000] UBI DBG (pid 1081): ubi_scan: process PEB 0
[   71.977000] UBI DBG (pid 1081): process_eb: scan PEB 0
[   71.983000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 0, only 0xFF bytes
[   71.992000] UBI DBG (pid 1081): add_to_list: add to free: PEB 0, EC
2233
[   72.001000] UBI DBG (pid 1081): ubi_scan: process PEB 1
[   72.006000] UBI DBG (pid 1081): process_eb: scan PEB 1
[   72.012000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 1, LEB 0:0,
EC 1, sqnum 4, bitflips 0
[   72.021000] UBI DBG (pid 1081): add_volume: added volume 0
[   72.029000] UBI DBG (pid 1081): ubi_scan: process PEB 2
[   72.034000] UBI DBG (pid 1081): process_eb: scan PEB 2
[   72.040000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 2, LEB 0:1,
EC 2232, sqnum 204304, bitflips 0
[   72.051000] UBI DBG (pid 1081): ubi_scan: process PEB 3
[   72.057000] UBI DBG (pid 1081): process_eb: scan PEB 3
[   72.063000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 3, LEB 0:2,
EC 2232, sqnum 204305, bitflips 0
[   72.072000] UBI DBG (pid 1081): ubi_scan: process PEB 4
[   72.078000] UBI DBG (pid 1081): process_eb: scan PEB 4
[   72.084000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 4, only 0xFF bytes
[   72.093000] UBI DBG (pid 1081): add_to_list: add to free: PEB 4, EC
2233
[   72.101000] UBI DBG (pid 1081): ubi_scan: process PEB 5
[   72.106000] UBI DBG (pid 1081): process_eb: scan PEB 5
[   72.112000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 5, only 0xFF bytes
[   72.121000] UBI DBG (pid 1081): add_to_list: add to free: PEB 5, EC
2233
[   72.129000] UBI DBG (pid 1081): ubi_scan: process PEB 6
[   72.134000] UBI DBG (pid 1081): process_eb: scan PEB 6
[   72.140000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 6, only 0xFF bytes
[   72.149000] UBI DBG (pid 1081): add_to_list: add to free: PEB 6, EC
2233
[   72.157000] UBI DBG (pid 1081): ubi_scan: process PEB 7
[   72.162000] UBI DBG (pid 1081): process_eb: scan PEB 7
[   72.168000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 7, only 0xFF bytes
[   72.177000] UBI DBG (pid 1081): add_to_list: add to free: PEB 7, EC
2233
[   72.185000] UBI DBG (pid 1081): ubi_scan: process PEB 8
[   72.190000] UBI DBG (pid 1081): process_eb: scan PEB 8
[   72.196000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 8, only 0xFF bytes
[   72.205000] UBI DBG (pid 1081): add_to_list: add to free: PEB 8, EC
2233
[   72.213000] UBI DBG (pid 1081): ubi_scan: process PEB 9
[   72.219000] UBI DBG (pid 1081): process_eb: scan PEB 9
[   72.224000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 9, only 0xFF bytes
[   72.233000] UBI DBG (pid 1081): add_to_list: add to free: PEB 9, EC
2233
[   72.241000] UBI DBG (pid 1081): ubi_scan: process PEB 10
[   72.246000] UBI DBG (pid 1081): process_eb: scan PEB 10
[   72.252000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 10, only 0xFF bytes
[   72.262000] UBI DBG (pid 1081): add_to_list: add to free: PEB 10,
EC 2233
[   72.269000] UBI DBG (pid 1081): ubi_scan: process PEB 11
[   72.275000] UBI DBG (pid 1081): process_eb: scan PEB 11
[   72.281000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 11, LEB 0:7,
EC 2231, sqnum 204227, bitflips 0
[   72.291000] UBI DBG (pid 1081): ubi_scan: process PEB 12
[   72.297000] UBI DBG (pid 1081): process_eb: scan PEB 12
[   72.303000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 12, only 0xFF bytes
[   72.312000] UBI DBG (pid 1081): add_to_list: add to free: PEB 12,
EC 2233
[   72.320000] UBI DBG (pid 1081): ubi_scan: process PEB 13
[   72.325000] UBI DBG (pid 1081): process_eb: scan PEB 13
[   72.331000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 13, only 0xFF bytes
[   72.341000] UBI DBG (pid 1081): add_to_list: add to free: PEB 13,
EC 2233
[   72.348000] UBI DBG (pid 1081): ubi_scan: process PEB 14
[   72.354000] UBI DBG (pid 1081): process_eb: scan PEB 14
[   72.360000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 14, only 0xFF bytes
[   72.369000] UBI DBG (pid 1081): add_to_list: add to free: PEB 14,
EC 2233
[   72.376000] UBI DBG (pid 1081): ubi_scan: process PEB 15
[   72.382000] UBI DBG (pid 1081): process_eb: scan PEB 15
[   72.388000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 15, LEB
0:81, EC 2223, sqnum 203519, bitflips 0
[   72.399000] UBI DBG (pid 1081): ubi_scan: process PEB 16
[   72.404000] UBI DBG (pid 1081): process_eb: scan PEB 16
[   72.410000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 16, only 0xFF bytes
[   72.419000] UBI DBG (pid 1081): add_to_list: add to free: PEB 16,
EC 2233
[   72.427000] UBI DBG (pid 1081): ubi_scan: process PEB 17
[   72.432000] UBI DBG (pid 1081): process_eb: scan PEB 17
[   72.438000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 17, only 0xFF bytes
[   72.448000] UBI DBG (pid 1081): add_to_list: add to free: PEB 17,
EC 2233
[   72.455000] UBI DBG (pid 1081): ubi_scan: process PEB 18
[   72.461000] UBI DBG (pid 1081): process_eb: scan PEB 18
[   72.467000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 18, only 0xFF bytes
[   72.476000] UBI DBG (pid 1081): add_to_list: add to free: PEB 18,
EC 2233
[   72.484000] UBI DBG (pid 1081): ubi_scan: process PEB 19
[   72.489000] UBI DBG (pid 1081): process_eb: scan PEB 19
[   72.495000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 19, only 0xFF bytes
[   72.504000] UBI DBG (pid 1081): add_to_list: add to free: PEB 19,
EC 2233
[   72.512000] UBI DBG (pid 1081): ubi_scan: process PEB 20
[   72.518000] UBI DBG (pid 1081): process_eb: scan PEB 20
[   72.524000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 20, only 0xFF bytes
[   72.533000] UBI DBG (pid 1081): add_to_list: add to free: PEB 20,
EC 2233
[   72.541000] UBI DBG (pid 1081): ubi_scan: process PEB 21
[   72.546000] UBI DBG (pid 1081): process_eb: scan PEB 21
[   72.552000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 21, only 0xFF bytes
[   72.562000] UBI DBG (pid 1081): add_to_list: add to free: PEB 21,
EC 2233
[   72.569000] UBI DBG (pid 1081): ubi_scan: process PEB 22
[   72.575000] UBI DBG (pid 1081): process_eb: scan PEB 22
[   72.581000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 22, only 0xFF bytes
[   72.590000] UBI DBG (pid 1081): add_to_list: add to free: PEB 22,
EC 2233
[   72.598000] UBI DBG (pid 1081): ubi_scan: process PEB 23
[   72.603000] UBI DBG (pid 1081): process_eb: scan PEB 23
[   72.609000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 23, LEB 0:4,
EC 2232, sqnum 204323, bitflips 0
[   72.620000] UBI DBG (pid 1081): ubi_scan: process PEB 24
[   72.625000] UBI DBG (pid 1081): process_eb: scan PEB 24
[   72.631000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 24, only 0xFF bytes
[   72.640000] UBI DBG (pid 1081): add_to_list: add to free: PEB 24,
EC 2232
[   72.648000] UBI DBG (pid 1081): ubi_scan: process PEB 25
[   72.653000] UBI DBG (pid 1081): process_eb: scan PEB 25
[   72.660000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 25, only 0xFF bytes
[   72.669000] UBI DBG (pid 1081): add_to_list: add to free: PEB 25,
EC 2232
[   72.677000] UBI DBG (pid 1081): ubi_scan: process PEB 26
[   72.682000] UBI DBG (pid 1081): process_eb: scan PEB 26
[   72.688000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 26, only 0xFF bytes
[   72.697000] UBI DBG (pid 1081): add_to_list: add to free: PEB 26,
EC 2232
[   72.705000] UBI DBG (pid 1081): ubi_scan: process PEB 27
[   72.711000] UBI DBG (pid 1081): process_eb: scan PEB 27
[   72.717000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 27, only 0xFF bytes
[   72.726000] UBI DBG (pid 1081): add_to_list: add to free: PEB 27,
EC 2232
[   72.734000] UBI DBG (pid 1081): ubi_scan: process PEB 28
[   72.740000] UBI DBG (pid 1081): process_eb: scan PEB 28
[   72.746000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 28, only 0xFF bytes
[   72.755000] UBI DBG (pid 1081): add_to_list: add to free: PEB 28,
EC 2232
[   72.763000] UBI DBG (pid 1081): ubi_scan: process PEB 29
[   72.768000] UBI DBG (pid 1081): process_eb: scan PEB 29
[   72.774000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 29, only 0xFF bytes
[   72.783000] UBI DBG (pid 1081): add_to_list: add to free: PEB 29,
EC 2232
[   72.791000] UBI DBG (pid 1081): ubi_scan: process PEB 30
[   72.796000] UBI DBG (pid 1081): process_eb: scan PEB 30
[   72.802000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 30, only 0xFF bytes
[   72.812000] UBI DBG (pid 1081): add_to_list: add to free: PEB 30,
EC 2232
[   72.819000] UBI DBG (pid 1081): ubi_scan: process PEB 31
[   72.825000] UBI DBG (pid 1081): process_eb: scan PEB 31
[   72.831000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 31, only 0xFF bytes
[   72.840000] UBI DBG (pid 1081): add_to_list: add to free: PEB 31,
EC 2232
[   72.848000] UBI DBG (pid 1081): ubi_scan: process PEB 32
[   72.853000] UBI DBG (pid 1081): process_eb: scan PEB 32
[   72.860000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 32, only 0xFF bytes
[   72.869000] UBI DBG (pid 1081): add_to_list: add to free: PEB 32,
EC 2232
[   72.876000] UBI DBG (pid 1081): ubi_scan: process PEB 33
[   72.882000] UBI DBG (pid 1081): process_eb: scan PEB 33
[   72.888000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 33, only 0xFF bytes
[   72.897000] UBI DBG (pid 1081): add_to_list: add to free: PEB 33,
EC 2232
[   72.905000] UBI DBG (pid 1081): ubi_scan: process PEB 34
[   72.910000] UBI DBG (pid 1081): process_eb: scan PEB 34
[   72.916000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 34, only 0xFF bytes
[   72.926000] UBI DBG (pid 1081): add_to_list: add to free: PEB 34,
EC 2232
[   72.933000] UBI DBG (pid 1081): ubi_scan: process PEB 35
[   72.939000] UBI DBG (pid 1081): process_eb: scan PEB 35
[   72.945000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 35, only 0xFF bytes
[   72.954000] UBI DBG (pid 1081): add_to_list: add to free: PEB 35,
EC 2232
[   72.962000] UBI DBG (pid 1081): ubi_scan: process PEB 36
[   72.967000] UBI DBG (pid 1081): process_eb: scan PEB 36
[   72.973000] UBI DBG (pid 1081): ubi_scan: process PEB 37
[   72.978000] UBI DBG (pid 1081): process_eb: scan PEB 37
[   72.984000] UBI DBG (pid 1081): ubi_scan: process PEB 38
[   72.989000] UBI DBG (pid 1081): process_eb: scan PEB 38
[   72.995000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 38, only 0xFF bytes
[   73.005000] UBI DBG (pid 1081): add_to_list: add to free: PEB 38,
EC 2232
[   73.012000] UBI DBG (pid 1081): ubi_scan: process PEB 39
[   73.018000] UBI DBG (pid 1081): process_eb: scan PEB 39
[   73.024000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 39, only 0xFF bytes
[   73.033000] UBI DBG (pid 1081): add_to_list: add to free: PEB 39,
EC 2232
[   73.041000] UBI DBG (pid 1081): ubi_scan: process PEB 40
[   73.046000] UBI DBG (pid 1081): process_eb: scan PEB 40
[   73.052000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 40, only 0xFF bytes
[   73.061000] UBI DBG (pid 1081): add_to_list: add to free: PEB 40,
EC 2232
[   73.069000] UBI DBG (pid 1081): ubi_scan: process PEB 41
[   73.074000] UBI DBG (pid 1081): process_eb: scan PEB 41
[   73.080000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 41, only 0xFF bytes
[   73.090000] UBI DBG (pid 1081): add_to_list: add to free: PEB 41,
EC 2232
[   73.097000] UBI DBG (pid 1081): ubi_scan: process PEB 42
[   73.102000] UBI DBG (pid 1081): process_eb: scan PEB 42
[   73.108000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 42, only 0xFF bytes
[   73.118000] UBI DBG (pid 1081): add_to_list: add to free: PEB 42,
EC 2232
[   73.125000] UBI DBG (pid 1081): ubi_scan: process PEB 43
[   73.131000] UBI DBG (pid 1081): process_eb: scan PEB 43
[   73.137000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 43, only 0xFF bytes
[   73.146000] UBI DBG (pid 1081): add_to_list: add to free: PEB 43,
EC 2232
[   73.153000] UBI DBG (pid 1081): ubi_scan: process PEB 44
[   73.159000] UBI DBG (pid 1081): process_eb: scan PEB 44
[   73.165000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 44, only 0xFF bytes
[   73.174000] UBI DBG (pid 1081): add_to_list: add to free: PEB 44,
EC 2232
[   73.181000] UBI DBG (pid 1081): ubi_scan: process PEB 45
[   73.187000] UBI DBG (pid 1081): process_eb: scan PEB 45
[   73.193000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 45, only 0xFF bytes
[   73.202000] UBI DBG (pid 1081): add_to_list: add to free: PEB 45,
EC 2232
[   73.209000] UBI DBG (pid 1081): ubi_scan: process PEB 46
[   73.215000] UBI DBG (pid 1081): process_eb: scan PEB 46
[   73.221000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 46, only 0xFF bytes
[   73.230000] UBI DBG (pid 1081): add_to_list: add to free: PEB 46,
EC 2232
[   73.237000] UBI DBG (pid 1081): ubi_scan: process PEB 47
[   73.243000] UBI DBG (pid 1081): process_eb: scan PEB 47
[   73.249000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 47, only 0xFF bytes
[   73.258000] UBI DBG (pid 1081): add_to_list: add to free: PEB 47,
EC 2232
[   73.265000] UBI DBG (pid 1081): ubi_scan: process PEB 48
[   73.271000] UBI DBG (pid 1081): process_eb: scan PEB 48
[   73.277000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 48, only 0xFF bytes
[   73.286000] UBI DBG (pid 1081): add_to_list: add to free: PEB 48,
EC 2232
[   73.293000] UBI DBG (pid 1081): ubi_scan: process PEB 49
[   73.299000] UBI DBG (pid 1081): process_eb: scan PEB 49
[   73.305000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 49, only 0xFF bytes
[   73.314000] UBI DBG (pid 1081): add_to_list: add to free: PEB 49,
EC 2232
[   73.322000] UBI DBG (pid 1081): ubi_scan: process PEB 50
[   73.327000] UBI DBG (pid 1081): process_eb: scan PEB 50
[   73.333000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 50, only 0xFF bytes
[   73.342000] UBI DBG (pid 1081): add_to_list: add to free: PEB 50,
EC 2232
[   73.349000] UBI DBG (pid 1081): ubi_scan: process PEB 51
[   73.355000] UBI DBG (pid 1081): process_eb: scan PEB 51
[   73.361000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 51, only 0xFF bytes
[   73.370000] UBI DBG (pid 1081): add_to_list: add to free: PEB 51,
EC 2232
[   73.378000] UBI DBG (pid 1081): ubi_scan: process PEB 52
[   73.383000] UBI DBG (pid 1081): process_eb: scan PEB 52
[   73.389000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 52, LEB
0:82, EC 2215, sqnum 203365, bitflips 0
[   73.399000] UBI DBG (pid 1081): ubi_scan: process PEB 53
[   73.405000] UBI DBG (pid 1081): process_eb: scan PEB 53
[   73.411000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 53, only 0xFF bytes
[   73.420000] UBI DBG (pid 1081): add_to_list: add to free: PEB 53,
EC 2232
[   73.427000] UBI DBG (pid 1081): ubi_scan: process PEB 54
[   73.433000] UBI DBG (pid 1081): process_eb: scan PEB 54
[   73.439000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 54, only 0xFF bytes
[   73.448000] UBI DBG (pid 1081): add_to_list: add to free: PEB 54,
EC 2232
[   73.455000] UBI DBG (pid 1081): ubi_scan: process PEB 55
[   73.461000] UBI DBG (pid 1081): process_eb: scan PEB 55
[   73.467000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 55, only 0xFF bytes
[   73.476000] UBI DBG (pid 1081): add_to_list: add to free: PEB 55,
EC 2232
[   73.483000] UBI DBG (pid 1081): ubi_scan: process PEB 56
[   73.489000] UBI DBG (pid 1081): process_eb: scan PEB 56
[   73.494000] UBI DBG (pid 1081): ubi_scan: process PEB 57
[   73.500000] UBI DBG (pid 1081): process_eb: scan PEB 57
[   73.506000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 57, only 0xFF bytes
[   73.515000] UBI DBG (pid 1081): add_to_list: add to free: PEB 57,
EC 2232
[   73.523000] UBI DBG (pid 1081): ubi_scan: process PEB 58
[   73.528000] UBI DBG (pid 1081): process_eb: scan PEB 58
[   73.534000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 58, LEB
0:88, EC 2067, sqnum 189195, bitflips 0
[   73.544000] UBI DBG (pid 1081): ubi_scan: process PEB 59
[   73.549000] UBI DBG (pid 1081): process_eb: scan PEB 59
[   73.555000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 59, only 0xFF bytes
[   73.565000] UBI DBG (pid 1081): add_to_list: add to free: PEB 59,
EC 2232
[   73.572000] UBI DBG (pid 1081): ubi_scan: process PEB 60
[   73.577000] UBI DBG (pid 1081): process_eb: scan PEB 60
[   73.583000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 60, only 0xFF bytes
[   73.593000] UBI DBG (pid 1081): add_to_list: add to free: PEB 60,
EC 2232
[   73.600000] UBI DBG (pid 1081): ubi_scan: process PEB 61
[   73.606000] UBI DBG (pid 1081): process_eb: scan PEB 61
[   73.612000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 61, only 0xFF bytes
[   73.621000] UBI DBG (pid 1081): add_to_list: add to free: PEB 61,
EC 2232
[   73.628000] UBI DBG (pid 1081): ubi_scan: process PEB 62
[   73.634000] UBI DBG (pid 1081): process_eb: scan PEB 62
[   73.640000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 62, only 0xFF bytes
[   73.649000] UBI DBG (pid 1081): add_to_list: add to free: PEB 62,
EC 2232
[   73.656000] UBI DBG (pid 1081): ubi_scan: process PEB 63
[   73.662000] UBI DBG (pid 1081): process_eb: scan PEB 63
[   73.668000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 63, only 0xFF bytes
[   73.677000] UBI DBG (pid 1081): add_to_list: add to free: PEB 63,
EC 2232
[   73.685000] UBI DBG (pid 1081): ubi_scan: process PEB 64
[   73.690000] UBI DBG (pid 1081): process_eb: scan PEB 64
[   73.697000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 64, only 0xFF bytes
[   73.706000] UBI DBG (pid 1081): add_to_list: add to free: PEB 64,
EC 2232
[   73.713000] UBI DBG (pid 1081): ubi_scan: process PEB 65
[   73.719000] UBI DBG (pid 1081): process_eb: scan PEB 65
[   73.724000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 65, only 0xFF bytes
[   73.734000] UBI DBG (pid 1081): add_to_list: add to free: PEB 65,
EC 2232
[   73.741000] UBI DBG (pid 1081): ubi_scan: process PEB 66
[   73.747000] UBI DBG (pid 1081): process_eb: scan PEB 66
[   73.753000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 66, LEB
0:83, EC 2231, sqnum 204276, bitflips 0
[   73.763000] UBI DBG (pid 1081): ubi_scan: process PEB 67
[   73.768000] UBI DBG (pid 1081): process_eb: scan PEB 67
[   73.774000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 67, only 0xFF bytes
[   73.783000] UBI DBG (pid 1081): add_to_list: add to free: PEB 67,
EC 2232
[   73.791000] UBI DBG (pid 1081): ubi_scan: process PEB 68
[   73.796000] UBI DBG (pid 1081): process_eb: scan PEB 68
[   73.802000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 68, only 0xFF bytes
[   73.812000] UBI DBG (pid 1081): add_to_list: add to free: PEB 68,
EC 2232
[   73.819000] UBI DBG (pid 1081): ubi_scan: process PEB 69
[   73.824000] UBI DBG (pid 1081): process_eb: scan PEB 69
[   73.830000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 69, only 0xFF bytes
[   73.840000] UBI DBG (pid 1081): add_to_list: add to free: PEB 69,
EC 2232
[   73.847000] UBI DBG (pid 1081): ubi_scan: process PEB 70
[   73.853000] UBI DBG (pid 1081): process_eb: scan PEB 70
[   73.859000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 70, only 0xFF bytes
[   73.868000] UBI DBG (pid 1081): add_to_list: add to free: PEB 70,
EC 2232
[   73.876000] UBI DBG (pid 1081): ubi_scan: process PEB 71
[   73.881000] UBI DBG (pid 1081): process_eb: scan PEB 71
[   73.887000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 71, only 0xFF bytes
[   73.896000] UBI DBG (pid 1081): add_to_list: add to free: PEB 71,
EC 2232
[   73.904000] UBI DBG (pid 1081): ubi_scan: process PEB 72
[   73.909000] UBI DBG (pid 1081): process_eb: scan PEB 72
[   73.915000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 72, only 0xFF bytes
[   73.925000] UBI DBG (pid 1081): add_to_list: add to free: PEB 72,
EC 2232
[   73.932000] UBI DBG (pid 1081): ubi_scan: process PEB 73
[   73.937000] UBI DBG (pid 1081): process_eb: scan PEB 73
[   73.943000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 73, only 0xFF bytes
[   73.953000] UBI DBG (pid 1081): add_to_list: add to free: PEB 73,
EC 2232
[   73.960000] UBI DBG (pid 1081): ubi_scan: process PEB 74
[   73.966000] UBI DBG (pid 1081): process_eb: scan PEB 74
[   73.972000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 74, only 0xFF bytes
[   73.981000] UBI DBG (pid 1081): add_to_list: add to free: PEB 74,
EC 2232
[   73.988000] UBI DBG (pid 1081): ubi_scan: process PEB 75
[   73.994000] UBI DBG (pid 1081): process_eb: scan PEB 75
[   74.000000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 75, only 0xFF bytes
[   74.009000] UBI DBG (pid 1081): add_to_list: add to free: PEB 75,
EC 2232
[   74.017000] UBI DBG (pid 1081): ubi_scan: process PEB 76
[   74.022000] UBI DBG (pid 1081): process_eb: scan PEB 76
[   74.028000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 76, only 0xFF bytes
[   74.037000] UBI DBG (pid 1081): add_to_list: add to free: PEB 76,
EC 2232
[   74.045000] UBI DBG (pid 1081): ubi_scan: process PEB 77
[   74.050000] UBI DBG (pid 1081): process_eb: scan PEB 77
[   74.056000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 77, only 0xFF bytes
[   74.065000] UBI DBG (pid 1081): add_to_list: add to free: PEB 77,
EC 2232
[   74.073000] UBI DBG (pid 1081): ubi_scan: process PEB 78
[   74.079000] UBI DBG (pid 1081): process_eb: scan PEB 78
[   74.085000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 78, only 0xFF bytes
[   74.094000] UBI DBG (pid 1081): add_to_list: add to free: PEB 78,
EC 2232
[   74.101000] UBI DBG (pid 1081): ubi_scan: process PEB 79
[   74.107000] UBI DBG (pid 1081): process_eb: scan PEB 79
[   74.113000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 79, only 0xFF bytes
[   74.122000] UBI DBG (pid 1081): add_to_list: add to free: PEB 79,
EC 2232
[   74.130000] UBI DBG (pid 1081): ubi_scan: process PEB 80
[   74.135000] UBI DBG (pid 1081): process_eb: scan PEB 80
[   74.141000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 80, LEB
0:70, EC 2231, sqnum 204290, bitflips 0
[   74.151000] UBI DBG (pid 1081): ubi_scan: process PEB 81
[   74.157000] UBI DBG (pid 1081): process_eb: scan PEB 81
[   74.163000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 81, only 0xFF bytes
[   74.172000] UBI DBG (pid 1081): add_to_list: add to free: PEB 81,
EC 2232
[   74.180000] UBI DBG (pid 1081): ubi_scan: process PEB 82
[   74.185000] UBI DBG (pid 1081): process_eb: scan PEB 82
[   74.191000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 82, only 0xFF bytes
[   74.201000] UBI DBG (pid 1081): add_to_list: add to free: PEB 82,
EC 2232
[   74.208000] UBI DBG (pid 1081): ubi_scan: process PEB 83
[   74.213000] UBI DBG (pid 1081): process_eb: scan PEB 83
[   74.220000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 83, LEB 0:6,
EC 2231, sqnum 204294, bitflips 0
[   74.229000] UBI DBG (pid 1081): ubi_scan: process PEB 84
[   74.235000] UBI DBG (pid 1081): process_eb: scan PEB 84
[   74.241000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 84, only 0xFF bytes
[   74.250000] UBI DBG (pid 1081): add_to_list: add to free: PEB 84,
EC 2232
[   74.258000] UBI DBG (pid 1081): ubi_scan: process PEB 85
[   74.263000] UBI DBG (pid 1081): process_eb: scan PEB 85
[   74.269000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 85, only 0xFF bytes
[   74.279000] UBI DBG (pid 1081): add_to_list: add to free: PEB 85,
EC 2232
[   74.286000] UBI DBG (pid 1081): ubi_scan: process PEB 86
[   74.292000] UBI DBG (pid 1081): process_eb: scan PEB 86
[   74.298000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 86, only 0xFF bytes
[   74.307000] UBI DBG (pid 1081): add_to_list: add to free: PEB 86,
EC 2232
[   74.314000] UBI DBG (pid 1081): ubi_scan: process PEB 87
[   74.320000] UBI DBG (pid 1081): process_eb: scan PEB 87
[   74.326000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 87, only 0xFF bytes
[   74.335000] UBI DBG (pid 1081): add_to_list: add to free: PEB 87,
EC 2232
[   74.343000] UBI DBG (pid 1081): ubi_scan: process PEB 88
[   74.348000] UBI DBG (pid 1081): process_eb: scan PEB 88
[   74.354000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 88, only 0xFF bytes
[   74.363000] UBI DBG (pid 1081): add_to_list: add to free: PEB 88,
EC 2232
[   74.371000] UBI DBG (pid 1081): ubi_scan: process PEB 89
[   74.376000] UBI DBG (pid 1081): process_eb: scan PEB 89
[   74.382000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 89, LEB 0:8,
EC 2220, sqnum 203326, bitflips 0
[   74.392000] UBI DBG (pid 1081): ubi_scan: process PEB 90
[   74.398000] UBI DBG (pid 1081): process_eb: scan PEB 90
[   74.404000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 90, only 0xFF bytes
[   74.413000] UBI DBG (pid 1081): add_to_list: add to free: PEB 90,
EC 2232
[   74.421000] UBI DBG (pid 1081): ubi_scan: process PEB 91
[   74.426000] UBI DBG (pid 1081): process_eb: scan PEB 91
[   74.432000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 91, only 0xFF bytes
[   74.441000] UBI DBG (pid 1081): add_to_list: add to free: PEB 91,
EC 2232
[   74.449000] UBI DBG (pid 1081): ubi_scan: process PEB 92
[   74.454000] UBI DBG (pid 1081): process_eb: scan PEB 92
[   74.460000] UBI DBG (pid 1081): ubi_io_read_vid_hdr: no VID header
found at PEB 92, only 0xFF bytes
[   74.469000] UBI DBG (pid 1081): add_to_list: add to free: PEB 92,
EC 2232
[   74.477000] UBI DBG (pid 1081): ubi_scan: process PEB 93
[   74.482000] UBI DBG (pid 1081): process_eb: scan PEB 93
[   74.488000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 93, LEB
0:85, EC 2222, sqnum 203506, bitflips 0
[   74.499000] UBI DBG (pid 1081): ubi_scan: process PEB 94
[   74.504000] UBI DBG (pid 1081): process_eb: scan PEB 94
[   74.510000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 94, LEB
2147479551:1, EC 0, sqnum 2, bitflips 0
[   74.520000] UBI DBG (pid 1081): add_volume: added volume 2147479551
[   74.526000] UBI DBG (pid 1081): ubi_scan: process PEB 95
[   74.532000] UBI DBG (pid 1081): process_eb: scan PEB 95
[   74.538000] UBI DBG (pid 1081): ubi_scan_add_used: PEB 95, LEB
2147479551:0, EC 0, sqnum 1, bitflips 0
[   74.548000] UBI DBG (pid 1081): ubi_scan: scanning is finished
[   74.553000] UBI DBG (pid 1081): process_lvol: check layout volume
[   74.570000] UBI DBG (pid 1081): ubi_eba_init_scan: initialize EBA
sub-system
[   74.577000] UBI error: ubi_eba_init_scan: no enough physical
eraseblocks (0, need 1)
[   74.586000] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -28
ubiattach: error!: cannot attach mtd5
           error 28 (No space left on device)
