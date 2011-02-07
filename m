Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmTtC-0001Vk-MP
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 16:25:08 +0000
Date: Mon, 7 Feb 2011 17:25:23 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Artem Bityutskiy <dedekind1@gmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
Message-ID: <20110207172523.11294ec5@wker>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Holger Brunck <holger.brunck@keymile.com>, Detlev Zundel <dzu@denx.de>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Sun,  6 Feb 2011 15:17:45 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:
...
> You can find these patches also in the UBIFS git tree, 'cfi-nor-fix-v2'
> branch:
> git://git.infradead.org/ubifs-2.6.git cfi-nor-fix-v2
> 
> Please, test. These patches may break NAND setups as well, so anyone
> who is interested in having stable UBIFS in the next release, please,
> also test.

First test results with patches from cfi-nor-fix-v2 applied:

Test description:
Using Spansion NOR Flash S29GL512P (2 x16 chips in a 32-bit bank).
An application is continuously writing "ABC123" sequence in a file
on the UBIFS partition. A system reset is performed simulating a
power cut event. The board reboots, attaches UBI volume, mounts
the UBIFS partition and starts the test application again. 
117 power cut test cycles succeeded, at next cycle the UBIFS
partition recovery didn't succeed. Below is the kernel log with
UBI/UBIFS debug enabled:

UBI DBG (pid 1388): ctrl_cdev_ioctl: attach MTD device
UBI: attaching mtd5 to ubi0
UBI DBG (pid 1388): io_init: min_io_size      1
UBI DBG (pid 1388): io_init: max_write_size   64
UBI DBG (pid 1388): io_init: hdrs_min_io_size 1
UBI DBG (pid 1388): io_init: ec_hdr_alsize    64
UBI DBG (pid 1388): io_init: vid_hdr_alsize   64
UBI DBG (pid 1388): io_init: vid_hdr_offset   64
UBI DBG (pid 1388): io_init: vid_hdr_aloffset 64
UBI DBG (pid 1388): io_init: vid_hdr_shift    0
UBI DBG (pid 1388): io_init: leb_start        128
UBI DBG (pid 1388): io_init: max_erroneous    20
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    262016 bytes
UBI: smallest flash I/O unit:    1
UBI: VID header offset:          64 (aligned 64)
UBI: data offset:                128
UBI DBG (pid 1388): ubi_scan: process PEB 0
UBI DBG (pid 1388): ubi_scan: process PEB 1
UBI DBG (pid 1388): ubi_scan: process PEB 2
UBI DBG (pid 1388): ubi_scan: process PEB 3
UBI DBG (pid 1388): ubi_scan: process PEB 4
UBI DBG (pid 1388): ubi_scan: process PEB 5
UBI DBG (pid 1388): ubi_scan: process PEB 6
UBI DBG (pid 1388): ubi_scan: process PEB 7
UBI DBG (pid 1388): ubi_scan: process PEB 8
UBI DBG (pid 1388): ubi_scan: process PEB 9
UBI DBG (pid 1388): ubi_scan: process PEB 10
UBI DBG (pid 1388): ubi_scan: process PEB 11
UBI DBG (pid 1388): ubi_scan: process PEB 12
UBI DBG (pid 1388): ubi_scan: process PEB 13
UBI DBG (pid 1388): ubi_scan: process PEB 14
UBI DBG (pid 1388): ubi_scan: process PEB 15
UBI DBG (pid 1388): ubi_scan: process PEB 16
UBI DBG (pid 1388): ubi_scan: process PEB 17
UBI DBG (pid 1388): ubi_scan: process PEB 18
UBI DBG (pid 1388): ubi_scan: process PEB 19
UBI DBG (pid 1388): ubi_scan: process PEB 20
UBI DBG (pid 1388): ubi_scan: process PEB 21
UBI DBG (pid 1388): ubi_scan: process PEB 22
UBI DBG (pid 1388): ubi_scan: process PEB 23
UBI DBG (pid 1388): ubi_scan: process PEB 24
UBI DBG (pid 1388): ubi_scan: process PEB 25
UBI DBG (pid 1388): ubi_scan: process PEB 26
UBI DBG (pid 1388): ubi_scan: process PEB 27
UBI DBG (pid 1388): ubi_scan: process PEB 28
UBI DBG (pid 1388): ubi_scan: process PEB 29
UBI DBG (pid 1388): ubi_scan: process PEB 30
UBI DBG (pid 1388): ubi_scan: process PEB 31
UBI DBG (pid 1388): ubi_scan: process PEB 32
UBI DBG (pid 1388): ubi_scan: process PEB 33
UBI DBG (pid 1388): ubi_scan: process PEB 34
UBI DBG (pid 1388): ubi_scan: process PEB 35
UBI DBG (pid 1388): ubi_scan: process PEB 36
UBI DBG (pid 1388): ubi_scan: process PEB 37
UBI DBG (pid 1388): ubi_scan: process PEB 38
UBI DBG (pid 1388): ubi_scan: process PEB 39
UBI DBG (pid 1388): ubi_scan: process PEB 40
UBI DBG (pid 1388): ubi_scan: process PEB 41
UBI DBG (pid 1388): ubi_scan: process PEB 42
UBI DBG (pid 1388): ubi_scan: process PEB 43
UBI DBG (pid 1388): ubi_scan: process PEB 44
UBI DBG (pid 1388): ubi_scan: process PEB 45
UBI DBG (pid 1388): ubi_scan: process PEB 46
UBI DBG (pid 1388): ubi_scan: process PEB 47
UBI DBG (pid 1388): ubi_scan: process PEB 48
UBI DBG (pid 1388): ubi_scan: process PEB 49
UBI DBG (pid 1388): ubi_scan: process PEB 50
UBI DBG (pid 1388): ubi_scan: process PEB 51
UBI DBG (pid 1388): ubi_scan: process PEB 52
UBI DBG (pid 1388): ubi_scan: process PEB 53
UBI DBG (pid 1388): ubi_scan: process PEB 54
UBI DBG (pid 1388): ubi_scan: process PEB 55
UBI DBG (pid 1388): ubi_scan: process PEB 56
UBI DBG (pid 1388): ubi_scan: process PEB 57
UBI DBG (pid 1388): ubi_scan: process PEB 58
UBI DBG (pid 1388): ubi_scan: process PEB 59
UBI DBG (pid 1388): ubi_scan: process PEB 60
UBI DBG (pid 1388): ubi_scan: process PEB 61
UBI DBG (pid 1388): ubi_scan: process PEB 62
UBI DBG (pid 1388): ubi_scan: process PEB 63
UBI DBG (pid 1388): ubi_scan: process PEB 64
UBI DBG (pid 1388): ubi_scan: process PEB 65
UBI DBG (pid 1388): ubi_scan: process PEB 66
UBI DBG (pid 1388): ubi_scan: process PEB 67
UBI DBG (pid 1388): ubi_scan: process PEB 68
UBI DBG (pid 1388): ubi_scan: process PEB 69
UBI DBG (pid 1388): ubi_scan: process PEB 70
UBI DBG (pid 1388): ubi_scan: process PEB 71
UBI DBG (pid 1388): ubi_scan: process PEB 72
UBI DBG (pid 1388): ubi_scan: process PEB 73
UBI DBG (pid 1388): ubi_scan: process PEB 74
UBI DBG (pid 1388): ubi_scan: process PEB 75
UBI DBG (pid 1388): ubi_scan: process PEB 76
UBI DBG (pid 1388): ubi_scan: process PEB 77
UBI DBG (pid 1388): ubi_scan: process PEB 78
UBI DBG (pid 1388): ubi_scan: process PEB 79
UBI DBG (pid 1388): ubi_scan: process PEB 80
UBI DBG (pid 1388): ubi_scan: process PEB 81
UBI DBG (pid 1388): ubi_scan: process PEB 82
UBI DBG (pid 1388): ubi_scan: process PEB 83
UBI DBG (pid 1388): ubi_scan: process PEB 84
UBI DBG (pid 1388): ubi_scan: process PEB 85
UBI DBG (pid 1388): ubi_scan: process PEB 86
UBI DBG (pid 1388): ubi_scan: process PEB 87
UBI DBG (pid 1388): ubi_scan: process PEB 88
UBI DBG (pid 1388): ubi_scan: process PEB 89
UBI DBG (pid 1388): ubi_scan: process PEB 90
UBI DBG (pid 1388): ubi_scan: process PEB 91
UBI DBG (pid 1388): ubi_scan: process PEB 92
UBI DBG (pid 1388): ubi_scan: process PEB 93
UBI DBG (pid 1388): ubi_scan: process PEB 94
UBI DBG (pid 1388): ubi_scan: process PEB 95
UBI DBG (pid 1388): ubi_scan: process PEB 96
UBI DBG (pid 1388): ubi_scan: process PEB 97
UBI DBG (pid 1388): ubi_scan: process PEB 98
UBI DBG (pid 1388): ubi_scan: process PEB 99
UBI DBG (pid 1388): ubi_scan: process PEB 100
UBI DBG (pid 1388): ubi_scan: process PEB 101
UBI DBG (pid 1388): ubi_scan: process PEB 102
UBI DBG (pid 1388): ubi_scan: process PEB 103
UBI DBG (pid 1388): ubi_scan: process PEB 104
UBI DBG (pid 1388): ubi_scan: process PEB 105
UBI DBG (pid 1388): ubi_scan: process PEB 106
UBI DBG (pid 1388): ubi_scan: process PEB 107
UBI DBG (pid 1388): ubi_scan: process PEB 108
UBI DBG (pid 1388): ubi_scan: process PEB 109
UBI DBG (pid 1388): ubi_scan: process PEB 110
UBI DBG (pid 1388): ubi_scan: process PEB 111
UBI DBG (pid 1388): ubi_scan: process PEB 112
UBI DBG (pid 1388): ubi_scan: process PEB 113
UBI DBG (pid 1388): ubi_scan: process PEB 114
UBI DBG (pid 1388): ubi_scan: process PEB 115
UBI DBG (pid 1388): ubi_scan: process PEB 116
UBI DBG (pid 1388): ubi_scan: process PEB 117
UBI DBG (pid 1388): ubi_scan: process PEB 118
UBI DBG (pid 1388): ubi_scan: process PEB 119
UBI DBG (pid 1388): ubi_scan: process PEB 120
UBI DBG (pid 1388): ubi_scan: process PEB 121
UBI DBG (pid 1388): ubi_scan: process PEB 122
UBI DBG (pid 1388): ubi_scan: process PEB 123
UBI DBG (pid 1388): ubi_scan: process PEB 124
UBI DBG (pid 1388): ubi_scan: process PEB 125
UBI DBG (pid 1388): ubi_scan: process PEB 126
UBI DBG (pid 1388): ubi_scan: process PEB 127
UBI DBG (pid 1388): ubi_scan: process PEB 128
UBI DBG (pid 1388): ubi_scan: process PEB 129
UBI DBG (pid 1388): ubi_scan: process PEB 130
UBI DBG (pid 1388): ubi_scan: process PEB 131
UBI DBG (pid 1388): ubi_scan: process PEB 132
UBI DBG (pid 1388): ubi_scan: process PEB 133
UBI DBG (pid 1388): ubi_scan: process PEB 134
UBI DBG (pid 1388): ubi_scan: process PEB 135
UBI DBG (pid 1388): ubi_scan: process PEB 136
UBI DBG (pid 1388): ubi_scan: process PEB 137
UBI DBG (pid 1388): ubi_scan: process PEB 138
UBI DBG (pid 1388): ubi_scan: process PEB 139
UBI DBG (pid 1388): ubi_scan: process PEB 140
UBI DBG (pid 1388): ubi_scan: process PEB 141
UBI DBG (pid 1388): ubi_scan: process PEB 142
UBI DBG (pid 1388): ubi_scan: process PEB 143
UBI DBG (pid 1388): ubi_scan: process PEB 144
UBI DBG (pid 1388): ubi_scan: process PEB 145
UBI DBG (pid 1388): ubi_scan: process PEB 146
UBI DBG (pid 1388): ubi_scan: process PEB 147
UBI DBG (pid 1388): ubi_scan: process PEB 148
UBI DBG (pid 1388): ubi_scan: process PEB 149
UBI DBG (pid 1388): ubi_scan: process PEB 150
UBI DBG (pid 1388): ubi_scan: process PEB 151
UBI DBG (pid 1388): ubi_scan: process PEB 152
UBI DBG (pid 1388): ubi_scan: process PEB 153
UBI DBG (pid 1388): ubi_scan: process PEB 154
UBI DBG (pid 1388): ubi_scan: process PEB 155
UBI DBG (pid 1388): ubi_scan: process PEB 156
UBI DBG (pid 1388): ubi_scan: process PEB 157
UBI DBG (pid 1388): ubi_scan: process PEB 158
UBI DBG (pid 1388): ubi_scan: process PEB 159
UBI DBG (pid 1388): ubi_scan: process PEB 160
UBI DBG (pid 1388): ubi_scan: process PEB 161
UBI DBG (pid 1388): ubi_scan: process PEB 162
UBI DBG (pid 1388): ubi_scan: process PEB 163
UBI DBG (pid 1388): ubi_scan: process PEB 164
UBI DBG (pid 1388): ubi_scan: process PEB 165
UBI DBG (pid 1388): ubi_scan: process PEB 166
UBI DBG (pid 1388): ubi_scan: process PEB 167
UBI DBG (pid 1388): ubi_scan: process PEB 168
UBI DBG (pid 1388): ubi_scan: process PEB 169
UBI DBG (pid 1388): ubi_scan: process PEB 170
UBI DBG (pid 1388): ubi_scan: process PEB 171
UBI DBG (pid 1388): ubi_scan: process PEB 172
UBI DBG (pid 1388): ubi_scan: process PEB 173
UBI DBG (pid 1388): ubi_scan: process PEB 174
UBI DBG (pid 1388): ubi_scan: process PEB 175
UBI DBG (pid 1388): ubi_scan: process PEB 176
UBI DBG (pid 1388): ubi_scan: process PEB 177
UBI DBG (pid 1388): ubi_scan: process PEB 178
UBI DBG (pid 1388): ubi_scan: process PEB 179
UBI DBG (pid 1388): ubi_scan: process PEB 180
UBI DBG (pid 1388): ubi_scan: process PEB 181
UBI DBG (pid 1388): ubi_scan: process PEB 182
UBI DBG (pid 1388): ubi_scan: process PEB 183
UBI DBG (pid 1388): ubi_scan: process PEB 184
UBI DBG (pid 1388): ubi_scan: process PEB 185
UBI DBG (pid 1388): ubi_scan: process PEB 186
UBI DBG (pid 1388): ubi_scan: process PEB 187
UBI DBG (pid 1388): ubi_scan: process PEB 188
UBI DBG (pid 1388): ubi_scan: process PEB 189
UBI DBG (pid 1388): ubi_scan: process PEB 190
UBI DBG (pid 1388): ubi_scan: process PEB 191
UBI DBG (pid 1388): ubi_scan: process PEB 192
UBI DBG (pid 1388): ubi_scan: process PEB 193
UBI DBG (pid 1388): ubi_scan: process PEB 194
UBI DBG (pid 1388): ubi_scan: process PEB 195
UBI DBG (pid 1388): ubi_scan: process PEB 196
UBI DBG (pid 1388): ubi_scan: process PEB 197
UBI DBG (pid 1388): ubi_scan: process PEB 198
UBI DBG (pid 1388): ubi_scan: process PEB 199
UBI DBG (pid 1388): ubi_scan: process PEB 200
UBI DBG (pid 1388): ubi_scan: process PEB 201
UBI DBG (pid 1388): ubi_scan: process PEB 202
UBI DBG (pid 1388): ubi_scan: process PEB 203
UBI DBG (pid 1388): ubi_scan: process PEB 204
UBI DBG (pid 1388): ubi_scan: process PEB 205
UBI DBG (pid 1388): ubi_scan: process PEB 206
UBI DBG (pid 1388): ubi_scan: process PEB 207
UBI DBG (pid 1388): ubi_scan: scanning is finished
UBI: max. sequence number:       2249
UBI DBG (pid 1388): process_lvol: check layout volume
UBI DBG (pid 1388): uif_init: ubi0 major is 253
UBI DBG (pid 1388): ubi_add_volume: add volume 0
UBI: attached mtd5 to ubi0
UBI: MTD device name:            "homefs"
UBI: MTD device size:            52 MiB
UBI: number of good PEBs:        208
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 208
UBI: number of PEBs reserved for bad PEB handling: 0
UBI: max/mean erase counter: 38/26
UBI: image sequence number:  1893240021
UBI: background thread "ubi_bgt0d" started, PID 1391
UBI DBG (pid 1392): ubi_open_volume_path: open volume ubi0:homefs, mode 1
UBI DBG (pid 1392): ubi_open_volume_nm: open device 0, volume homefs, mode 1
UBI DBG (pid 1392): ubi_open_volume: open device 0, volume 0, mode 1
UBI DBG (pid 1392): ubi_open_volume: open device 0, volume 0, mode 2
UBI DBG (pid 1392): ubi_is_mapped: test LEB 0:0
UBI DBG (pid 1392): ubi_leb_read: read 4096 bytes from LEB 0:0:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 1:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:1:0
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:0 (262016 bytes left)
UBIFS DBG (pid 1394): ubifs_bg_thread: background thread "ubifs_bgt0_0" started, PID 1394
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:512 (261504 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:1024 (260992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:1536 (260480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:2048 (259968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:2560 (259456 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:3072 (258944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:3584 (258432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:4096 (257920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:4608 (257408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:5120 (256896 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:5632 (256384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:6144 (255872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:6656 (255360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:7168 (254848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:7680 (254336 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:8192 (253824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:8704 (253312 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:9216 (252800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:9728 (252288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:10240 (251776 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:10752 (251264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:11264 (250752 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:11776 (250240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:12288 (249728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:12800 (249216 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:13312 (248704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:13824 (248192 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:14336 (247680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:14848 (247168 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:15360 (246656 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:15872 (246144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:16384 (245632 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:16896 (245120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:17408 (244608 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:17920 (244096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:18432 (243584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:18944 (243072 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:19456 (242560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:19968 (242048 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:20480 (241536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:20992 (241024 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:21504 (240512 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:22016 (240000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:22528 (239488 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:23040 (238976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:23552 (238464 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:24064 (237952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:24576 (237440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:25088 (236928 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:25600 (236416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:26112 (235904 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:26624 (235392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:27136 (234880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:27648 (234368 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:28160 (233856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:28672 (233344 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:29184 (232832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:29696 (232320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:30208 (231808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:30720 (231296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:31232 (230784 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:31744 (230272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:32256 (229760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:32768 (229248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:33280 (228736 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:33792 (228224 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:34304 (227712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:34816 (227200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:35328 (226688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:35840 (226176 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:36352 (225664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:36864 (225152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:37376 (224640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:37888 (224128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:38400 (223616 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:38912 (223104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:39424 (222592 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:39936 (222080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:40448 (221568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:40960 (221056 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:41472 (220544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:41984 (220032 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:42496 (219520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:43008 (219008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:43520 (218496 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:44032 (217984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:44544 (217472 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:45056 (216960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:45568 (216448 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:46080 (215936 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:46592 (215424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:47104 (214912 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:47616 (214400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:48128 (213888 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:48640 (213376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:49152 (212864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:49664 (212352 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:50176 (211840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:50688 (211328 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:51200 (210816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:51712 (210304 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:52224 (209792 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:52736 (209280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:53248 (208768 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:53760 (208256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:54272 (207744 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:54784 (207232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:55296 (206720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:55808 (206208 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:56320 (205696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:56832 (205184 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:57344 (204672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:57856 (204160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:58368 (203648 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:58880 (203136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:59392 (202624 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:59904 (202112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:60416 (201600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 1:60928 (201088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 1 at offset 60928
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 2:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:2:0
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:512 (261504 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:1024 (260992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:1536 (260480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:2048 (259968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:2560 (259456 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:3072 (258944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:3584 (258432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:4096 (257920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:4608 (257408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:5120 (256896 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:5632 (256384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:6144 (255872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:6656 (255360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:7168 (254848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:7680 (254336 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:8192 (253824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:8704 (253312 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:9216 (252800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:9728 (252288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:10240 (251776 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:10752 (251264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:11264 (250752 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:11776 (250240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:12288 (249728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:12800 (249216 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:13312 (248704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:13824 (248192 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:14336 (247680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:14848 (247168 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:15360 (246656 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:15872 (246144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:16384 (245632 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:16896 (245120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:17408 (244608 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:17920 (244096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:18432 (243584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:18944 (243072 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:19456 (242560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:19968 (242048 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:20480 (241536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:20992 (241024 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:21504 (240512 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:22016 (240000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:22528 (239488 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:23040 (238976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:23552 (238464 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:24064 (237952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:24576 (237440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:25088 (236928 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:25600 (236416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:26112 (235904 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:26624 (235392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:27136 (234880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:27648 (234368 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:28160 (233856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:28672 (233344 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:29184 (232832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:29696 (232320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:30208 (231808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:30720 (231296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:31232 (230784 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:31744 (230272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:32256 (229760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:32768 (229248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:33280 (228736 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:33792 (228224 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:34304 (227712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:34816 (227200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:35328 (226688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:35840 (226176 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:36352 (225664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:36864 (225152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:37376 (224640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:37888 (224128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:38400 (223616 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:38912 (223104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:39424 (222592 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:39936 (222080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:40448 (221568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:40960 (221056 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:41472 (220544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:41984 (220032 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:42496 (219520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:43008 (219008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:43520 (218496 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:44032 (217984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:44544 (217472 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:45056 (216960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:45568 (216448 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:46080 (215936 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:46592 (215424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:47104 (214912 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:47616 (214400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:48128 (213888 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:48640 (213376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:49152 (212864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:49664 (212352 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:50176 (211840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:50688 (211328 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:51200 (210816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:51712 (210304 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:52224 (209792 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:52736 (209280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:53248 (208768 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:53760 (208256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:54272 (207744 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:54784 (207232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:55296 (206720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:55808 (206208 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:56320 (205696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:56832 (205184 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:57344 (204672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:57856 (204160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:58368 (203648 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:58880 (203136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:59392 (202624 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:59904 (202112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:60416 (201600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 2:60928 (201088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 2 at offset 60928
UBI DBG (pid 1392): ubi_leb_read: read 88 bytes from LEB 0:25:42848
UBIFS: recovery needed
UBIFS DBG (pid 1392): ubifs_recover_inl_heads: checking index head at 25:42936
UBI DBG (pid 1392): ubi_leb_read: read 64 bytes from LEB 0:25:42936
UBIFS DBG (pid 1392): ubifs_recover_inl_heads: checking LPT head at 7:32680
UBI DBG (pid 1392): ubi_leb_read: read 64 bytes from LEB 0:7:32680
UBI DBG (pid 1392): ubi_leb_read: read 12 bytes from LEB 0:7:32400
UBI DBG (pid 1392): ubi_leb_unmap: unmap LEB 0:8
UBI DBG (pid 1392): ubi_leb_read: read 13 bytes from LEB 0:7:32662
UBI DBG (pid 1392): ubi_leb_read: read 13 bytes from LEB 0:7:32649
UBI DBG (pid 1392): ubi_leb_read: read 13 bytes from LEB 0:7:32484
UBI DBG (pid 1392): ubi_leb_read: read 18 bytes from LEB 0:7:32466
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 4:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:4:0
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning commit start node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:32 (261984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:96 (261920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:160 (261856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:224 (261792 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:288 (261728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:352 (261664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:416 (261600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:480 (261536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:544 (261472 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:608 (261408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:672 (261344 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:736 (261280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:800 (261216 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:864 (261152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:928 (261088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:992 (261024 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:1056 (260960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:1120 (260896 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:1184 (260832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 4:1248 (260768 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 4 at offset 1248
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 5:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:5:0
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning commit start node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:32 (261984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:96 (261920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:160 (261856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:224 (261792 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:288 (261728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:352 (261664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:416 (261600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:480 (261536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:544 (261472 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:608 (261408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:672 (261344 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:736 (261280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:800 (261216 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:864 (261152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:928 (261088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:992 (261024 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:1056 (260960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:1120 (260896 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:1184 (260832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:1248 (260768 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1392): ubifs_scan: look at LEB 5:1312 (260704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 5 at offset 1312
UBIFS DBG (pid 1392): ubifs_recover_leb: 14:48480
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 14:48480
UBI DBG (pid 1392): ubi_leb_read: read 213536 bytes from LEB 0:14:48480
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:48480 (213536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:48640 (213376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning truncate node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:48696 (213320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:48856 (213160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:49016 (213000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:49176 (212840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:49336 (212680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:49496 (212520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:49656 (212360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:49816 (212200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:49976 (212040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:50136 (211880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:50296 (211720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:50456 (211560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:50616 (211400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:50776 (211240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:50936 (211080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:51096 (210920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:51256 (210760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:51416 (210600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:51576 (210440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:51736 (210280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:51896 (210120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:52056 (209960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:52216 (209800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:52376 (209640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:52536 (209480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:52696 (209320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:52856 (209160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:53016 (209000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:53176 (208840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:53336 (208680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:53496 (208520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:53656 (208360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:53816 (208200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:53976 (208040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:54136 (207880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:54296 (207720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:54456 (207560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:54616 (207400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:54776 (207240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:54936 (207080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:55096 (206920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:55256 (206760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:55416 (206600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:55576 (206440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:55736 (206280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:55896 (206120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:56056 (205960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:56216 (205800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:56376 (205640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:56536 (205480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:56696 (205320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:56856 (205160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:57016 (205000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:57176 (204840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:57336 (204680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:57496 (204520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:57656 (204360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:57816 (204200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:57976 (204040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:58136 (203880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:58296 (203720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:58456 (203560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:58616 (203400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:58776 (203240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:58936 (203080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:59096 (202920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:59256 (202760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:59416 (202600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:59576 (202440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:59736 (202280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:59896 (202120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:60056 (201960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:60216 (201800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:60376 (201640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:60536 (201480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:60696 (201320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:60856 (201160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:61016 (201000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:61176 (200840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:61336 (200680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:61496 (200520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:61656 (200360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:61816 (200200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:61976 (200040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:62136 (199880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:62296 (199720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:62456 (199560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:62616 (199400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:62776 (199240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:62936 (199080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:63096 (198920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:63256 (198760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:63416 (198600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:63576 (198440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:63736 (198280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:63896 (198120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:64056 (197960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:64216 (197800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:64376 (197640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:64536 (197480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:64696 (197320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:64856 (197160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:65016 (197000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:65176 (196840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:65336 (196680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:65496 (196520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:65656 (196360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:65816 (196200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:65976 (196040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:66136 (195880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:66296 (195720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:66456 (195560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:66616 (195400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:66776 (195240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:66936 (195080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:67096 (194920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:67256 (194760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:67416 (194600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:67576 (194440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:67736 (194280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:67896 (194120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:68056 (193960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:68216 (193800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:68376 (193640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:68536 (193480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:68696 (193320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:68856 (193160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:69016 (193000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:69176 (192840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:69336 (192680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:69496 (192520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:69656 (192360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:69816 (192200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:69976 (192040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:70136 (191880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:70296 (191720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:70456 (191560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:70616 (191400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:70776 (191240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:70936 (191080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:71096 (190920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:71256 (190760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:71416 (190600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:71576 (190440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:71736 (190280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:71896 (190120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:72056 (189960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:72216 (189800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:72376 (189640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:72536 (189480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:72696 (189320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:72856 (189160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:73016 (189000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:73176 (188840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:73336 (188680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:73496 (188520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:73656 (188360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:73816 (188200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:73976 (188040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:74136 (187880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:74296 (187720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:74456 (187560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:74616 (187400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:74776 (187240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:74936 (187080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:75096 (186920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:75256 (186760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:75416 (186600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:75576 (186440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:75736 (186280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:75896 (186120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:76056 (185960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:76216 (185800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:76376 (185640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:76536 (185480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:76696 (185320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:76856 (185160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:77016 (185000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:77176 (184840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:77336 (184680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:77496 (184520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:77656 (184360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:77816 (184200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:77976 (184040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:78136 (183880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:78296 (183720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:78456 (183560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:78616 (183400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:78776 (183240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:78936 (183080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:79096 (182920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:79256 (182760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:79416 (182600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:79576 (182440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:79736 (182280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:79896 (182120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:80056 (181960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:80216 (181800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:80376 (181640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:80536 (181480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:80696 (181320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:80856 (181160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:81016 (181000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:81176 (180840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:81336 (180680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:81496 (180520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:81656 (180360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:81816 (180200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:81976 (180040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:82136 (179880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:82296 (179720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:82456 (179560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:82616 (179400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:82776 (179240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:82936 (179080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:83096 (178920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:83256 (178760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:83416 (178600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:83576 (178440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:83736 (178280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:83896 (178120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:84056 (177960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:84216 (177800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:84376 (177640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:84536 (177480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:84696 (177320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:84856 (177160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:85016 (177000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:85176 (176840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:85336 (176680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:85496 (176520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:85656 (176360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:85816 (176200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:85976 (176040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:86136 (175880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:86296 (175720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:86456 (175560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:86616 (175400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:86776 (175240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:86936 (175080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:87096 (174920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:87256 (174760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:87416 (174600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:87576 (174440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:87736 (174280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:87896 (174120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:88056 (173960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:88216 (173800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:88376 (173640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:88536 (173480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:88696 (173320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:88856 (173160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:89016 (173000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:89176 (172840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:89336 (172680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:89496 (172520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:89656 (172360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:89816 (172200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:89976 (172040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:90136 (171880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:90296 (171720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:90456 (171560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:90616 (171400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:90776 (171240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:90936 (171080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:91096 (170920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:91256 (170760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:91416 (170600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:91576 (170440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:91736 (170280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:91896 (170120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:92056 (169960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:92216 (169800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:92376 (169640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:92536 (169480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:92696 (169320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:92856 (169160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:93016 (169000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:93176 (168840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:93336 (168680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:93496 (168520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:93656 (168360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:93816 (168200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:93976 (168040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:94136 (167880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:94296 (167720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:94456 (167560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:94616 (167400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:94776 (167240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:94936 (167080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:95096 (166920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:95256 (166760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:95416 (166600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:95576 (166440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:95736 (166280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:95896 (166120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:96056 (165960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:96216 (165800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:96376 (165640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:96536 (165480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:96696 (165320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:96856 (165160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:97016 (165000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:97176 (164840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:97336 (164680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:97496 (164520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:97656 (164360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:97816 (164200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:97976 (164040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:98136 (163880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:98296 (163720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:98456 (163560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:98616 (163400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:98776 (163240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:98936 (163080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:99096 (162920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:99256 (162760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:99416 (162600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:99576 (162440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:99736 (162280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:99896 (162120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:100056 (161960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:100216 (161800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:100376 (161640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:100536 (161480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:100696 (161320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:100856 (161160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:101016 (161000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:101176 (160840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:101336 (160680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:101496 (160520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:101656 (160360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:101816 (160200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:101976 (160040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:102136 (159880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:102296 (159720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:102456 (159560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:102616 (159400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:102776 (159240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:102936 (159080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:103096 (158920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:103256 (158760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:103416 (158600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:103576 (158440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:103736 (158280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:103896 (158120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:104056 (157960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:104216 (157800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:104376 (157640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:104536 (157480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:104696 (157320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:104856 (157160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:105016 (157000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:105176 (156840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:105336 (156680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:105496 (156520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:105656 (156360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:105816 (156200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:105976 (156040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:106136 (155880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:106296 (155720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:106456 (155560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:106616 (155400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:106776 (155240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:106936 (155080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:107096 (154920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:107256 (154760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:107416 (154600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:107576 (154440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:107736 (154280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:107896 (154120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:108056 (153960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:108216 (153800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:108376 (153640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:108536 (153480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:108696 (153320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:108856 (153160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:109016 (153000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:109176 (152840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:109336 (152680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:109496 (152520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:109656 (152360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:109816 (152200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:109976 (152040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:110136 (151880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:110296 (151720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:110456 (151560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:110616 (151400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:110776 (151240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:110936 (151080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:111096 (150920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:111256 (150760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:111416 (150600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:111576 (150440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:111736 (150280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:111896 (150120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:112056 (149960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:112216 (149800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:112376 (149640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:112536 (149480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:112696 (149320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:112856 (149160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:113016 (149000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:113176 (148840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:113336 (148680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:113496 (148520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:113656 (148360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:113816 (148200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:113976 (148040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:114136 (147880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:114296 (147720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:114456 (147560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:114616 (147400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:114776 (147240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:114936 (147080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:115096 (146920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:115256 (146760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:115416 (146600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:115576 (146440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:115736 (146280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:115896 (146120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:116056 (145960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:116216 (145800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:116376 (145640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:116536 (145480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:116696 (145320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:116856 (145160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:117016 (145000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:117176 (144840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:117336 (144680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:117496 (144520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:117656 (144360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:117816 (144200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:117976 (144040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:118136 (143880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:118296 (143720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:118456 (143560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:118616 (143400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:118776 (143240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:118936 (143080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:119096 (142920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:119256 (142760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:119416 (142600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:119576 (142440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:119736 (142280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:119896 (142120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:120056 (141960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:120216 (141800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:120376 (141640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:120536 (141480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:120696 (141320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:120856 (141160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:121016 (141000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:121176 (140840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:121336 (140680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:121496 (140520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:121656 (140360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:121816 (140200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:121976 (140040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:122136 (139880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:122296 (139720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:122456 (139560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:122616 (139400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:122776 (139240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:122936 (139080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:123096 (138920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:123256 (138760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:123416 (138600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:123576 (138440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:123736 (138280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:123896 (138120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:124056 (137960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:124216 (137800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:124376 (137640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:124536 (137480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:124696 (137320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:124856 (137160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:125016 (137000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:125176 (136840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:125336 (136680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:125496 (136520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:125656 (136360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:125816 (136200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:125976 (136040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:126136 (135880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:126296 (135720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:126456 (135560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:126616 (135400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:126776 (135240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:126936 (135080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:127096 (134920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:127256 (134760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:127416 (134600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:127576 (134440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:127736 (134280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:127896 (134120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:128056 (133960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:128216 (133800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:128376 (133640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:128536 (133480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:128696 (133320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:128856 (133160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:129016 (133000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:129176 (132840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:129336 (132680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:129496 (132520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:129656 (132360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:129816 (132200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:129976 (132040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:130136 (131880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:130296 (131720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:130456 (131560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:130616 (131400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:130776 (131240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:130936 (131080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:131096 (130920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:131256 (130760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:131416 (130600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:131576 (130440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:131736 (130280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:131896 (130120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:132056 (129960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:132216 (129800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:132376 (129640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:132536 (129480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:132696 (129320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:132856 (129160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:133016 (129000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:133176 (128840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:133336 (128680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:133496 (128520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:133656 (128360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:133816 (128200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:133976 (128040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:134136 (127880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:134296 (127720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:134456 (127560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:134616 (127400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:134776 (127240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:134936 (127080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:135096 (126920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:135256 (126760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:135416 (126600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:135576 (126440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:135736 (126280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:135896 (126120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:136056 (125960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:136216 (125800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:136376 (125640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:136536 (125480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:136696 (125320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:136856 (125160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:137016 (125000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:137176 (124840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:137336 (124680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:137496 (124520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:137656 (124360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:137816 (124200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:137976 (124040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:138136 (123880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:138296 (123720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:138456 (123560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:138616 (123400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:138776 (123240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:138936 (123080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:139096 (122920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:139256 (122760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:139416 (122600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:139576 (122440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:139736 (122280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:139896 (122120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:140056 (121960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:140216 (121800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:140376 (121640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:140536 (121480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:140696 (121320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:140856 (121160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:141016 (121000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:141176 (120840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:141336 (120680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:141496 (120520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:141656 (120360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:141816 (120200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:141976 (120040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:142136 (119880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:142296 (119720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:142456 (119560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:142616 (119400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:142776 (119240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:142936 (119080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:143096 (118920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:143256 (118760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:143416 (118600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:143576 (118440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:143736 (118280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:143896 (118120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:144056 (117960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:144216 (117800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:144376 (117640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:144536 (117480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:144696 (117320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:144856 (117160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:145016 (117000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:145176 (116840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:145336 (116680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:145496 (116520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:145656 (116360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:145816 (116200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:145976 (116040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:146136 (115880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:146296 (115720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:146456 (115560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:146616 (115400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:146776 (115240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:146936 (115080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:147096 (114920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:147256 (114760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:147416 (114600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:147576 (114440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:147736 (114280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:147896 (114120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:148056 (113960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:148216 (113800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:148376 (113640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:148536 (113480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:148696 (113320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:148856 (113160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:149016 (113000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:149176 (112840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:149336 (112680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:149496 (112520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:149656 (112360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:149816 (112200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:149976 (112040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:150136 (111880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:150296 (111720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:150456 (111560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:150616 (111400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:150776 (111240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:150936 (111080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:151096 (110920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:151256 (110760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:151416 (110600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:151576 (110440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:151736 (110280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:151896 (110120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:152056 (109960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:152216 (109800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:152376 (109640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:152536 (109480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:152696 (109320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:152856 (109160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:153016 (109000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:153176 (108840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:153336 (108680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:153496 (108520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:153656 (108360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:153816 (108200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:153976 (108040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:154136 (107880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:154296 (107720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:154456 (107560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:154616 (107400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:154776 (107240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:154936 (107080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:155096 (106920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:155256 (106760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:155416 (106600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:155576 (106440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:155736 (106280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:155896 (106120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:156056 (105960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:156216 (105800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:156376 (105640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:156536 (105480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:156696 (105320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:156856 (105160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:157016 (105000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:157176 (104840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:157336 (104680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:157496 (104520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:157656 (104360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:157816 (104200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:157976 (104040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:158136 (103880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:158296 (103720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:158456 (103560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:158616 (103400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:158776 (103240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:158936 (103080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:159096 (102920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:159256 (102760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:159416 (102600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:159576 (102440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:159736 (102280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:159896 (102120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:160056 (101960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:160216 (101800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:160376 (101640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:160536 (101480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:160696 (101320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:160856 (101160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:161016 (101000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:161176 (100840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:161336 (100680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:161496 (100520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:161656 (100360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:161816 (100200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:161976 (100040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:162136 (99880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:162296 (99720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:162456 (99560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:162616 (99400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:162776 (99240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:162936 (99080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:163096 (98920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:163256 (98760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:163416 (98600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:163576 (98440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:163736 (98280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:163896 (98120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:164056 (97960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:164216 (97800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:164376 (97640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:164536 (97480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:164696 (97320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:164856 (97160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:165016 (97000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:165176 (96840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:165336 (96680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:165496 (96520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:165656 (96360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:165816 (96200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:165976 (96040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:166136 (95880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:166296 (95720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:166456 (95560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:166616 (95400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:166776 (95240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:166936 (95080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:167096 (94920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:167256 (94760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:167416 (94600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:167576 (94440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:167736 (94280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:167896 (94120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:168056 (93960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:168216 (93800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:168376 (93640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:168536 (93480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:168696 (93320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:168856 (93160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:169016 (93000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:169176 (92840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:169336 (92680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:169496 (92520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:169656 (92360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:169816 (92200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:169976 (92040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:170136 (91880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:170296 (91720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:170456 (91560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:170616 (91400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:170776 (91240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:170936 (91080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:171096 (90920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:171256 (90760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:171416 (90600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:171576 (90440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:171736 (90280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:171896 (90120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:172056 (89960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:172216 (89800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:172376 (89640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:172536 (89480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:172696 (89320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:172856 (89160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:173016 (89000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:173176 (88840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:173336 (88680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:173496 (88520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:173656 (88360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:173816 (88200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:173976 (88040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:174136 (87880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:174296 (87720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:174456 (87560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:174616 (87400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:174776 (87240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:174936 (87080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:175096 (86920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:175256 (86760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:175416 (86600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:175576 (86440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:175736 (86280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:175896 (86120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:176056 (85960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:176216 (85800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:176376 (85640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:176536 (85480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:176696 (85320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:176856 (85160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:177016 (85000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:177176 (84840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:177336 (84680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:177496 (84520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:177656 (84360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:177816 (84200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:177976 (84040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:178136 (83880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:178296 (83720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:178456 (83560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:178616 (83400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:178776 (83240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:178936 (83080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:179096 (82920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:179256 (82760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:179416 (82600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:179576 (82440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:179736 (82280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:179896 (82120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:180056 (81960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:180216 (81800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:180376 (81640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:180536 (81480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:180696 (81320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:180856 (81160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:181016 (81000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:181176 (80840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:181336 (80680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:181496 (80520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:181656 (80360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:181816 (80200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:181976 (80040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:182136 (79880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:182296 (79720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:182456 (79560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:182616 (79400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:182776 (79240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:182936 (79080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:183096 (78920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:183256 (78760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:183416 (78600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:183576 (78440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:183736 (78280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:183896 (78120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:184056 (77960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:184216 (77800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:184376 (77640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:184536 (77480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:184696 (77320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:184856 (77160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:185016 (77000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:185176 (76840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:185336 (76680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:185496 (76520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:185656 (76360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:185816 (76200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:185976 (76040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:186136 (75880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:186296 (75720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:186456 (75560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:186616 (75400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:186776 (75240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:186936 (75080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:187096 (74920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:187256 (74760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:187416 (74600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:187576 (74440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:187736 (74280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:187896 (74120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:188056 (73960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:188216 (73800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:188376 (73640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:188536 (73480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:188696 (73320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:188856 (73160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:189016 (73000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:189176 (72840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:189336 (72680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:189496 (72520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:189656 (72360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:189816 (72200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:189976 (72040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:190136 (71880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:190296 (71720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:190456 (71560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:190616 (71400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:190776 (71240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:190936 (71080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:191096 (70920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:191256 (70760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:191416 (70600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:191576 (70440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:191736 (70280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:191896 (70120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:192056 (69960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:192216 (69800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:192376 (69640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:192536 (69480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:192696 (69320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:192856 (69160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:193016 (69000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:193176 (68840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:193336 (68680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:193496 (68520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:193656 (68360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:193816 (68200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:193976 (68040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:194136 (67880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:194296 (67720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:194456 (67560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:194616 (67400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:194776 (67240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:194936 (67080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:195096 (66920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:195256 (66760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:195416 (66600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:195576 (66440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:195736 (66280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:195896 (66120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:196056 (65960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:196216 (65800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:196376 (65640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:196536 (65480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:196696 (65320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:196856 (65160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:197016 (65000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:197176 (64840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:197336 (64680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:197496 (64520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:197656 (64360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:197816 (64200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:197976 (64040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:198136 (63880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:198296 (63720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:198456 (63560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:198616 (63400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:198776 (63240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:198936 (63080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:199096 (62920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:199256 (62760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:199416 (62600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:199576 (62440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:199736 (62280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:199896 (62120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:200056 (61960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:200216 (61800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:200376 (61640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:200536 (61480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:200696 (61320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:200856 (61160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:201016 (61000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:201176 (60840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:201336 (60680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:201496 (60520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:201656 (60360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:201816 (60200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:201976 (60040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:202136 (59880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:202296 (59720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:202456 (59560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:202616 (59400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:202776 (59240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:202936 (59080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:203096 (58920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:203256 (58760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:203416 (58600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:203576 (58440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:203736 (58280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:203896 (58120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:204056 (57960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:204216 (57800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:204376 (57640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:204536 (57480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:204696 (57320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:204856 (57160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:205016 (57000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:205176 (56840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:205336 (56680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:205496 (56520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:205656 (56360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:205816 (56200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:205976 (56040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:206136 (55880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:206296 (55720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:206456 (55560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:206616 (55400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:206776 (55240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:206936 (55080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:207096 (54920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:207256 (54760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:207416 (54600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:207576 (54440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:207736 (54280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:207896 (54120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:208056 (53960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:208216 (53800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:208376 (53640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:208536 (53480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:208696 (53320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:208856 (53160 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:209016 (53000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:209176 (52840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:209336 (52680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:209496 (52520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:209656 (52360 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:209816 (52200 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:209976 (52040 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:210136 (51880 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:210296 (51720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:210456 (51560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:210616 (51400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:210776 (51240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:210936 (51080 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:211096 (50920 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:211256 (50760 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:211416 (50600 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:211576 (50440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:211736 (50280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:211896 (50120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:212056 (49960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:212216 (49800 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:212376 (49640 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:212536 (49480 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 14:212696 (49320 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 14 at offset 212696
UBIFS DBG (pid 1392): ubifs_recover_leb: 38:248640
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 38:248640
UBI DBG (pid 1392): ubi_leb_read: read 13376 bytes from LEB 0:38:248640
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 38:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 38:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 38:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 38:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 38 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 45:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 45:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:45:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 45:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 45 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 48:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 48:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:48:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 48:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 48 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 44:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 44:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:44:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 44:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 44 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 21:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 21:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:21:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 21:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 21 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 29:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 29:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:29:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 29:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 29 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 27:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 27:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:27:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 27:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 27 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 46:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 46:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:46:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 46:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 46 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 23:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 23:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:23:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 23:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 23 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 37:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 37:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:37:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 37:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 37 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 22:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 22:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:22:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 22:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 22 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 35:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 35:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:35:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 35:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 35 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 11:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 11:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:11:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 11:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 11 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 39:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 39:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:39:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 39:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 39 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 16:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 16:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:16:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 16:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 16 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 32:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 32:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:32:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 32:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 32 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 17:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 17:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:17:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:58016 (204000 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:62160 (199856 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:66304 (195712 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:70448 (191568 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:74592 (187424 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:78736 (183280 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:82880 (179136 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:87024 (174992 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:91168 (170848 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:95312 (166704 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:99456 (162560 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:103600 (158416 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:107744 (154272 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:111888 (150128 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:116032 (145984 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:120176 (141840 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:124320 (137696 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:128464 (133552 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:132608 (129408 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:136752 (125264 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:140896 (121120 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:145040 (116976 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:149184 (112832 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:153328 (108688 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:157472 (104544 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:161616 (100400 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:165760 (96256 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:169904 (92112 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:174048 (87968 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:178192 (83824 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:182336 (79680 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:186480 (75536 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:190624 (71392 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:194768 (67248 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:198912 (63104 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:203056 (58960 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:207200 (54816 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:211344 (50672 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:215488 (46528 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:219632 (42384 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:223776 (38240 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:227920 (34096 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:232064 (29952 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:236208 (25808 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:240352 (21664 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:244496 (17520 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:248640 (13376 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:252784 (9232 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:256928 (5088 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 17:261072 (944 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1392): ubifs_end_scan: stop scanning LEB 17 at offset 261072
UBIFS DBG (pid 1392): ubifs_recover_leb: 31:0
UBIFS DBG (pid 1392): ubifs_start_scan: scan LEB 31:0
UBI DBG (pid 1392): ubi_leb_read: read 262016 bytes from LEB 0:31:0
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:0 (262016 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:4144 (257872 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:8288 (253728 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:12432 (249584 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:16576 (245440 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:20720 (241296 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:24864 (237152 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:29008 (233008 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:33152 (228864 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:37296 (224720 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:41440 (220576 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:45584 (216432 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:49728 (212288 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning unknown node
UBIFS DBG (pid 1392): no_more_nodes: unexpected bad common header at 31:53872
UBIFS DBG (pid 1392): ubifs_recover_leb: look at LEB 31:53872 (208144 bytes left)
UBIFS DBG (pid 1392): ubifs_scan_a_node: scanning unknown node
UBIFS error (pid 1392): ubifs_check_node: bad node type 255
UBIFS error (pid 1392): ubifs_check_node: bad node at LEB 31:53872
	magic          0x6101831
	crc            0xf6863ee
	node_type      255 (unknown node)
	group_type     255 (unknown)
	sqnum          271387
	len            4294967295
node type 255 was not recognized
Call Trace:
[c774fb80] [c0007ecc] show_stack+0x4c/0x16c (unreliable)
[c774fbc0] [c013e588] ubifs_check_node+0x17c/0x308
[c774fbe0] [c0147e28] ubifs_scan_a_node+0x15c/0x2d8
[c774fc10] [c015d300] ubifs_recover_leb+0x3f0/0x940
[c774fc80] [c0148738] replay_buds+0xb4/0xb4c
[c774fd20] [c01498e4] ubifs_replay_journal+0x714/0xf5c
[c774fda0] [c013ac30] ubifs_fill_super+0xe24/0x16ac
[c774fe00] [c013c7bc] ubifs_get_sb+0x10c/0x344
[c774fe80] [c007b4d0] vfs_kern_mount+0x60/0x150
[c774fea0] [c007b610] do_kern_mount+0x40/0x100
[c774fec0] [c0092210] do_mount+0x40c/0x718
[c774ff10] [c00925ac] sys_mount+0x90/0xd8
[c774ff40] [c0010b44] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe93d18
    LR = 0x1000347c
UBIFS DBG (pid 1392): no_more_nodes: unexpected bad common header at 31:53872
UBIFS error (pid 1392): ubifs_recover_leb: bad node
UBIFS error (pid 1392): ubifs_scanned_corruption: corruption at LEB 31:53872
UBIFS error (pid 1392): ubifs_scanned_corruption: first 8192 bytes from LEB 31:53872
00000000: 31181006 ee63680f 1b240400 00000000 ffffffff ffffffff ffffffff ffffffff  1....ch..$......................
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
00000060: ffffffff ffffffff ffffffff ffffffff 43b13333 f1434371 72fb4142 c3b53233  ................C.33.CCqr.AB..23
00000080: 41f34331 72b34342 43313233 d1424331 ffffffff ffffffff ffffffff ffffffff  A.C1r.CBC123.BC1................
000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
...
00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
UBIFS error (pid 1392): ubifs_recover_leb: LEB 31 scanning failed
UBIFS DBG (pid 1394): ubifs_bg_thread: background thread "ubifs_bgt0_0" stops
UBI DBG (pid 1392): ubi_close_volume: close device 0, volume 0, mode 2
UBI DBG (pid 1392): ubi_close_volume: close device 0, volume 0, mode 1

I dropped the lines containing ffffffff in the dump above (verified
that these were all ffffffff).

The UBIFS data node before the dumped area seems to be okay
and contains "ABC123ABC123ABC123..." data block.

The corrupted area seems to contain data from an interrupted
write operation.

Thanks,
Anatolij 
